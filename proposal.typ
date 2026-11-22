#import "@local/prefs:0.1.0": *; #show: prefs

= Proposal
== How much does MTG reminder text matter?
=== James Bruce


#qb[*Your question:* What causal question do you want to answer? Identify the population, treatment/exposure, and outcome as clearly as you can.]

*Question:* Among people with little or no _Magic: The Gathering_ experience, does having keyword reminder text visible while answering game scenarios improve their accuracy?

*Population:* Volunteers recruited from classmates and other local contacts who have played fewer than five _Magic_ games in their lifetime. I will screen for prior play before assigning a survey version.

*Treatment:* Having keyword reminder text visible on a set of mock cards while answering the quiz. The comparison group will see the same cards without reminder text. In both groups, the cards will remain visible while respondents answer.

*Outcome:* The number correct on a 10-question quiz, with questions increasing in difficulty and asking respondents to resolve simple, realistic game scenarios. One quiz point is one additional correct answer. This measures immediate rules application with the cards available, not retention or broader gameplay strategy. 

#v(0.6em)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.35em,
  align: center,
  image("assets/no-reminder-healer-s-hawk.webp", width: 90%),
  image("assets/reminder-healer-s-hawk.webp", width: 90%),
  [*No reminder text*],
  [*Reminder text*],
)

#pagebreak()
#qb[*Your estimand:* What quantity would answer your question? Use potential-outcome notation and explain the quantity in words.]

Let $Y_i(1)$ be respondent $i$'s quiz score if reminder text is visible, and let $Y_i(0)$ be the score if the same cards appear without reminder text. Let $S$ be the set of eligible novice volunteers who enroll, with $n$ participants. My estimand is the average treatment effect for these participants:

$
  tau_S = 1/n sum_(i in S) (Y_i(1) - Y_i(0))
$

This is the average change in quiz points caused by displaying reminder text for the novices who participate. Random assignment identifies this sample effect; extending it to all novice _Magic_ players would require additional assumptions.



#qb[*Your data plan:* What dataset might answer the question, or what data would you need to collect? Identify the source and the variables you expect to need.]

I will collect responses with two Google Forms versions that differ only in reminder text. Before assignment, volunteers will answer, "How many _Magic: The Gathering_ games have you played in your lifetime?" I will define novices as those who answer zero to four. Using a computer-generated shuffled assignment list, I will privately send each eligible volunteer the next unused link; everyone will receive the same recruitment message and complete only one version. I will record assignment, eligibility, quiz answers, total correct, completion, and whether respondents looked up rules. The unit of observation is one respondent. I will provide a brief consent statement and collect no names or contact information.



#qb[*Feasibility:* What could prevent you from answering this question with the proposed data? For example, consider typical assumptions, sample size, measurement, timing, or missing information.]

Because assignment is randomized, a difference in average scores can identify the effect for participating novices if each person sees only their assigned version and one person's exposure does not affect another's answers. I will ask respondents not to discuss the quiz or look up rules while taking it, include a lookup question, and compare completion counts by group. I will check with the instructor about any class-project survey requirements.

Recruiting enough novices before the prospectus deadline may be difficult. A small convenience sample will limit precision and generalizability, so I will report the group sizes, the difference in average quiz points, and its uncertainty interval, and avoid claiming an effect for all new players. The result may also depend on the selected mechanics. I will choose a planned mix of mechanics and pilot the questions for unclear wording or scores that are all near zero or ten. The two survey versions will use the same card template, details, and quiz so reminder text is the only planned difference.





