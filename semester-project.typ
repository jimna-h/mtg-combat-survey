#import "@local/prefs:0.1.0": *
#show: prefs

= Stat 531 Semester Project
== Your Own Causal Question and Analysis
=== Fall 2026

= Project Overview

For this project, you will identify a question you would like to answer causally, find or collect data relevant to that question, and apply an appropriate method from the course. You will develop the project in stages so that you can get feedback on feasibility and design before presenting your results.

All three project submissions must be PDF files submitted on Gradescope. The proposal and prospectus should be PDF documents. The presentation submission should be PDF slides. The final presentations will take place during the last week of class, on December 8 and 10. Your presentation date and time slot will be assigned randomly. Everyone must submit their presentation slides on Gradescope by December 7 at 11:59 p.m. The slides will be loaded onto the classroom computer before class, so please do not plan to present from your own laptop.

= Project Milestones

#table(
  columns: (1.15fr, 1.5fr, 2fr),
  inset: 6pt,
  stroke: 0.5pt + luma(180),
  table.header([*Due date*], [*Milestone*], [*Purpose*]),
  [November 9],
  [Proposal (PDF document, submitted on Gradescope)],
  [Get feedback on your question, estimand, and data feasibility.],
  [November 20],
  [Prospectus (PDF document, submitted on Gradescope)],
  [Get feedback on the data you actually have and whether your proposed analysis is appropriate.],
  [December 7],
  [Presentation slides (PDF slides, submitted on Gradescope)],
  [Submit the slides that will be used in class.],
  [December 8 or 10],
  [In-class presentation],
  [Five-minute presentation on your project. Your date and time slot will be assigned randomly.],
)

*Note:* The two November due dates are flexible if you discuss it with me in advance. For example, if you choose to conduct a randomized experiment and collect your own data, I can understand if that could take more than two weeks. The December dates are firm, though.

= 1. Proposal: Monday, November 9

Submit a 1–2 page proposal as a PDF document on Gradescope with four sections:

- *Your question:* What causal question do you want to answer? Identify the population, treatment/exposure, and outcome as clearly as you can.
- *Your estimand:* What quantity would answer your question? Use potential-outcome notation and explain the quantity in words.
- *Your data plan:* What dataset might answer the question, or what data would you need to collect? Identify the source and the variables you expect to need.
- *Feasibility:* What could prevent you from answering this question with the proposed data? For example, consider typical assumptions, sample size, measurement, timing, or missing information.

The proposal is an initial plan, not a promise to use a particular dataset or method. The goal is to identify a promising question and allow issues to surface early.

= 2. Prospectus (data report and analysis plan): Friday, November 20

Submit a 2–3 page prospectus as a PDF document on Gradescope based on the data you actually have access to. Explain any changes from your original proposal, then describe how you plan to answer the revised question.

Include these sections:

- *The data in hand:* Describe the data source, unit of observation, sample size, the treatment, the outcome, and the covariates that are measured. Briefly describe any missing values or other data limitations. Confirm that you have the data needed for this project. Whether you are looking for an existing dataset or collecting it on your own, the deadline to have data is November 19, though extensions can be granted with prior approval.
- *The revised question and estimand:* State the question you can answer with these data and the estimand you will target, in potential-outcome notation. Explain what changed from your proposal and why.
- *The identification strategy:* Explain what assumptions would let you interpret your target quantity causally, and briefly assess their plausibility.
- *The analysis plan:* State the method you will use and why it fits the question, data, and assumptions.
- *Remaining concerns:* Identify unresolved issues where you would like feedback.

Naming an estimator alone is not an identification argument: explain why the proposed design and assumptions could identify the estimand. For example, matching or regression does not by itself rule out unmeasured confounding. Covariate balance can be a useful diagnostic for approaches such as matching or weighting, but balance is not a universal identification assumption. Randomization is important for experimental design, but “randomization” without a description of how randomization was done is insufficient.

Your question or estimand may need to change when you see the data. That is a normal part of the project. If you need to change your proposal’s plan, explain the limitations and present the most defensible revised question, estimand, and so forth.

= 3. In-class presentation: December 8 or 10

Prepare a 5-minute presentation on your project; this should probably be about 5–6 slides so you have one slide per minute (the title slide should be quicker). Your date and time slot will be assigned randomly. In order to have time for everyone’s presentation, I will hold you to at most 6 minutes so there is at least one minute for questions. Slides should be uploaded in advance so that transitions between students will be smooth. Submit your slides as a PDF on Gradescope by December 7 at 11:59 p.m. Slides will be loaded onto the classroom computer before class; you will not need to connect your own laptop.

Here’s my suggestion on how to organize your slides:

+ *Title slide:* State your question of interest and your name.
+ *Causal diagram:* Show a DAG that represents your causal story. Explain the key paths relevant to your analysis.
+ *Estimand:* Define the target population, treatment, outcome, and estimand. Include potential-outcome notation and a plain-language interpretation.
+ *Data:* Describe the source, sample, measures, and limitations that matter for the question of interest.
+ *Identification and analysis:* Explain the assumptions required for a causal interpretation, why they are or are not plausible, and the method you used. Include relevant diagnostics.
+ *Result and interpretation:* Report the estimated quantity, an uncertainty interval for the estimate if possible, and what the estimate means in the outcome’s units/in context of the problem.

= What Makes a Strong Project

A strong project connects the causal question, estimand, data, assumptions, and method. It is clear about what the data/analysis can and cannot establish. A modest estimate with a careful explanation is better than a strong causal claim that the design does not support. A well-reasoned conclusion that the available data do not support the original question can also make a successful project.
