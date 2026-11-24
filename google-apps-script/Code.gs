function setup() {
  const responseBook = SpreadsheetApp.create("MTG Combat Survey Responses");
  const responseSheet = responseBook.getSheets()[0];
  responseSheet.setName("Responses");
  responseSheet.appendRow([
    "received_at", "participant_id", "arm", "reminder_text", "eligible",
    "prior_play", "consented", "looked_up_rules", "score", "started_at",
    "finished_at", "tab_blurs", "answers_json"
  ]);
  const eligibilitySheet = responseBook.insertSheet("Eligibility");
  eligibilitySheet.appendRow([
    "received_at", "participant_id", "eligible", "prior_play", "consented",
    "started_at", "finished_at"
  ]);

  const emailBook = SpreadsheetApp.create("MTG Survey Results Requests");
  const emailSheet = emailBook.getSheets()[0];
  emailSheet.setName("Email Requests");
  emailSheet.appendRow(["email"]);

  const properties = PropertiesService.getScriptProperties();
  properties.setProperty("RESPONSE_SPREADSHEET_ID", responseBook.getId());
  properties.setProperty("EMAIL_SPREADSHEET_ID", emailBook.getId());
  Logger.log("Response sheet: " + responseBook.getUrl());
  Logger.log("Separate email sheet: " + emailBook.getUrl());
}

function doPost(event) {
  const lock = LockService.getScriptLock();
  lock.waitLock(30000);
  try {
    const data = JSON.parse(event.postData.contents || "{}");
    if (data.type !== "email" && !data.participantId) throw new Error("Missing participantId");

    if (data.type === "response") {
      validateResponse_(data);
      appendOnce_("Responses", data.participantId, [
        new Date(), data.participantId, data.arm, Boolean(data.reminder),
        Boolean(data.eligible), data.priorPlay, Boolean(data.consented),
        data.lookedUp, Number(data.score), data.startedAt, data.finishedAt,
        Number(data.tabBlurs || 0), JSON.stringify(data.answers)
      ]);
    } else if (data.type === "eligibility") {
      const sheet = getSheet_("RESPONSE_SPREADSHEET_ID", "Eligibility");
      sheet.appendRow([
        new Date(), data.participantId, Boolean(data.eligible), data.priorPlay,
        Boolean(data.consented), data.startedAt, data.finishedAt
      ]);
    } else if (data.type === "email") {
      const email = String(data.email || "").trim();
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) throw new Error("Invalid email");
      const sheet = getSheet_("EMAIL_SPREADSHEET_ID", "Email Requests");
      migrateEmailSheet_(sheet);
      sheet.appendRow([email]);
      shuffleEmailRows_(sheet);
    } else {
      throw new Error("Unknown submission type");
    }

    return json_({ ok: true });
  } catch (error) {
    return json_({ ok: false, error: String(error) });
  } finally {
    lock.releaseLock();
  }
}

function migrateEmailSheet_(sheet) {
  const lastRow = sheet.getLastRow();
  const lastColumn = sheet.getLastColumn();
  if (lastRow === 0) {
    sheet.appendRow(["email"]);
    return;
  }

  const headers = sheet.getRange(1, 1, 1, lastColumn).getValues()[0];
  const emailColumn = headers.findIndex(header => String(header).toLowerCase() === "email") + 1;
  if (emailColumn !== 1 || lastColumn !== 1 || String(headers[0]).toLowerCase() !== "email") {
    const emails = emailColumn > 0 && lastRow > 1
      ? sheet.getRange(2, emailColumn, lastRow - 1, 1).getValues().flat().filter(String)
      : [];
    sheet.clearContents();
    sheet.getRange(1, 1, emails.length + 1, 1)
      .setValues([["email"], ...emails.map(value => [value])]);
  }
}

function shuffleEmailRows_(sheet) {
  const lastRow = sheet.getLastRow();
  if (lastRow <= 2) return;

  const rows = sheet.getRange(2, 1, lastRow - 1, 1).getValues();
  for (let i = rows.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [rows[i], rows[j]] = [rows[j], rows[i]];
  }
  sheet.getRange(2, 1, rows.length, 1).setValues(rows);
}

function validateResponse_(data) {
  if (data.eligible !== true || data.consented !== true) throw new Error("Not eligible or not consented");
  if (data.arm !== "reminder" && data.arm !== "no_reminder") throw new Error("Invalid assignment");
  if (!Array.isArray(data.answers) || data.answers.length !== 10) throw new Error("Expected 10 answers");
  if (data.answers.some((answer, index) => answer.q !== index + 1)) throw new Error("Invalid answer sequence");
}

function appendOnce_(tabName, participantId, row) {
  const sheet = getSheet_("RESPONSE_SPREADSHEET_ID", tabName);
  const lastRow = sheet.getLastRow();
  if (lastRow > 1) {
    const found = sheet.getRange(2, 2, lastRow - 1, 1)
      .createTextFinder(participantId).matchEntireCell(true).findNext();
    if (found) throw new Error("This participant has already submitted");
  }
  sheet.appendRow(row);
}

function getSheet_(propertyName, sheetName) {
  const id = PropertiesService.getScriptProperties().getProperty(propertyName);
  if (!id) throw new Error("Run setup() before receiving submissions");
  const sheet = SpreadsheetApp.openById(id).getSheetByName(sheetName);
  if (!sheet) throw new Error("Missing sheet: " + sheetName);
  return sheet;
}

function json_(value) {
  return ContentService.createTextOutput(JSON.stringify(value))
    .setMimeType(ContentService.MimeType.JSON);
}
