# Google Sheets setup

The survey sends one response payload to a Google Apps Script web app. The script writes survey answers to one spreadsheet and optional results-request emails to a separate spreadsheet.

## Create the spreadsheets

1. Open [script.google.com](https://script.google.com) and create a standalone Apps Script project.
2. Replace its contents with `Code.gs` from this folder.
3. Run `setup()` once and approve the requested Google Sheets permissions. It creates both spreadsheets; copy their links from the execution log and keep them private.

## Deploy the receiver

1. In Apps Script, choose **Deploy → New deployment → Web app**.
2. Set **Execute as** to your account and access to **Anyone** so survey participants can submit without signing in.
3. Deploy, authorize if prompted, and copy the web-app URL ending in `/exec`.
4. In `index.html`, replace `PASTE_DEPLOYED_APPS_SCRIPT_URL_HERE` in `ENDPOINT` with that URL.
5. Host the updated site over HTTPS and submit a response to confirm it appears in the `Responses` tab.

The web app is public to submitters, so do not put private data or credentials in its source. The optional email address is written to the separate `MTG Survey Results Requests` spreadsheet, not the response spreadsheet. Limit access to both spreadsheets to the project team.

## Assignment

Eligible participants are assigned with a cryptographic 50/50 random draw after the eligibility check. The selected arm is kept in that browser tab's session storage so a refresh does not switch conditions. The submission records the arm and whether reminder text was displayed.
