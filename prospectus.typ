#import "@local/prefs:0.1.0": *; #show: prefs

= Project Prospectus
== How much does MTG reminder text matter?
=== James Bruce

== Where things stand and when I'll collect data

I'm still building the survey and its two versions, so I don't have any responses yet. Since the instructor said projects that collect their own data should lay out the collection plan, that's what this prospectus does instead of showing exploratory analysis. The survey compares quiz scores when keyword reminder text is visible against scores when it isn't.

Each data point will be one eligible volunteer. I'm planning to recruit classmates and other local people who have played few-to-no *Magic: The Gathering* games. For each person, the survey will record whether they're eligible, their answers to ten quiz questions, a total score from 0 to 10, whether they finished, and which version they got. It won't collect names or contact info. Because I haven't started collecting, I don't know yet how many people I'll get, how much will be missing, or how big each group will be. I'll report all of that in the final project. Everyone will get the same invitation and a private survey link.

#table(
  columns: (1fr, 2.8fr),
  [*When*], [*Planned work*],
  [Before Thanksgiving break], [Finish and pilot the questions and both forms. Make sure the forms differ only in reminder text and that the quiz is clear.],
  [Thanksgiving break], [Invite volunteers, check eligibility, assign eligible people using a computer-shuffled list, and collect responses.],
  [After the break], [Check for incomplete or missing responses, count how many people ended up in each group, look at the score distributions, and run the planned comparison.],
)

== Updated question and estimand

Here's the question: among eligible novice volunteers who finish the survey, how much does showing keyword reminder text change their score on a ten-question rules quiz, when the relevant cards are available while they answer?

Let $S$ be the set of eligible volunteers who participate, and let $n_S$ be how many there are. Let $Y_i(1)$ and $Y_i(0)$ be person $i$'s quiz score with reminder text visible and without it. The target is the sample average treatment effect:

$
  tau_S = 1 / n_S ∑_(i in S) (Y_i(1) - Y_i(0))
$

In plain terms, this is the average number of quiz points the reminder text adds or takes away for the novices who take part. The question and estimand are the same as in my original proposal. What changed is the timing: the survey is still in development, and I'll collect responses over Thanksgiving break instead of already having them. My conclusions will only cover the people who participate. A convenience sample doesn't let me say anything about all novice players.

== Identification strategy

Before recruiting, I'll make a shuffled assignment list. For each eligible volunteer, I'll privately send the next unused link, which puts them in one of the two forms. Both groups get the same invitation and the same eligibility question, and each person fills out only one form. Everything else stays the same (cards, questions, order, layout) except whether the keyword reminder text is shown.

If I follow this process, who gets which form has nothing to do with how well they'd score either way. As long as I run it consistently, people don't influence each other, and I get everyone's score, the difference in average scores between the two groups gives me the sample average treatment effect.

The main things that could go wrong are mixed-up links, people submitting more than once, people talking to each other or sharing answers, and people dropping out after they've been assigned. I'll keep assignments private and ask people not to discuss the quiz or look up answers. That helps, but it can't promise nobody influences anybody else, and it can't fully fix bias if one group drops out more than the other. If scores are missing, I'll report how many by group and be careful about how I read the comparison.

== Analysis plan

I'll report how many people were assigned to and finished each version, how much is missing, and how the scores are spread out. The main estimate is the difference in average total score between the two versions, along with an uncertainty interval. Under this random assignment setup, that directly estimates the effect I defined above. With a small convenience sample, the interval could be wide. If so, I'll be upfront about the uncertainty, and I won't treat a fuzzy result as proof there's no effect. The score only shows how well people apply a few mechanics right now with the cards in front of them. It doesn't tell us about remembering rules later or being good at the game in general.

== Remaining concerns

I might not get many people, which would make the estimate less precise. Using volunteers also limits who the results apply to. The quiz only covers a handful of mechanics, so I'll pilot it to catch confusing wording and scores that bunch up at 0 or 10. I'd love feedback on two things: whether my question set does a good job of representing the keyword mechanics beginners actually run into, and how to handle people who start the survey but don't finish after being assigned.