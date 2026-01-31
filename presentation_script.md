# Thesis Defense Presentation Script
## Gender Differences in Responses to LLM-Generated vs Human-Written Donation Appeals
### Total Time: ~25 minutes

---

## SLIDE 1: Title Slide (1 minute)

"Good [morning/afternoon], members of the committee. My name is Salah-din Mrait, and today I will present my bachelor thesis titled 'Gender Differences in Responses to LLM-Generated versus Human-Written Donation Appeals.'

This research was conducted as part of my Data Science Joint Degree at Tilburg University and Eindhoven University of Technology, under the supervision of John Caffier."

---

## SLIDE 2: The Research Problem (2 minutes)

"Let me start by explaining why this research matters.

Charitable organizations are increasingly using Large Language Models — or LLMs — to create their donation appeals. This is happening at a time when we know that gender is one of the strongest predictors of giving behavior. Women consistently donate more frequently and give higher amounts than men.

Here's the tension: LLMs can produce emotionally polished language that sounds caring and empathetic. But they don't actually feel anything. They lack genuine emotional experience.

Women tend to value emotional authenticity more than men. So my central question became: Will women respond differently to these machine-generated appeals? Will they see through the artificial empathy?

This led to my main research question: Do women and men respond differently to LLM-generated versus human-written emotional donation appeals for cancer charities?"

---

## SLIDE 3: Theoretical Background (2 minutes)

"I built my predictions on three psychological mechanisms.

First, empathic concern. Women report higher levels of empathy, and when emotional engagement drives persuasion, perceived sincerity becomes important. If LLMs are perceived as lacking a genuine mind, emotional engagement might weaken — especially for women.

Second, algorithm aversion. Research shows people trust algorithms less in emotional and moral domains compared to technical tasks. Since women place greater weight on trust and relational signals, they might react more negatively once they know content comes from an LLM.

Third, the care versus justice orientation. Gilligan's work shows women tend to adopt care-focused moral reasoning centered on relationships, while men lean toward rule-based thinking. If LLM appeals weaken the perception of a caring relationship, effectiveness might decline specifically for women.

Based on these mechanisms, I expected women to respond less positively to LLM-generated content."

---

## SLIDE 4: Hypotheses (2 minutes)

"This led to four specific hypotheses.

H1 predicted that women would rate LLM-generated appeals as less persuasive compared to human-written appeals, measured on a 1-7 Likert scale, while men would show no such difference.

H2a predicted that women would donate higher amounts than men overall, regardless of the appeal source. This was my main effect hypothesis based on the well-established gender gap in giving.

H2b predicted an interaction: that the difference in donation amounts between men and women would be larger for human-written appeals. In other words, the gender gap would shrink for LLM content.

H3 predicted that women's likelihood of selecting 'Like' for engagement would be higher for human-written appeals compared to LLM appeals.

The common thread is that I expected women to show stronger preferences for human content across all outcomes."

---

## SLIDE 5: Research Methods (2 minutes)

"Now let me describe how I tested these hypotheses.

I analyzed data from 725 U.S. participants who each evaluated six donation appeals for cancer charities. This gave me 4,350 total observations.

The study used a within-subjects design where participants saw both human-written and LLM-generated appeals. The appeals were presented as authentic social media fundraising posts — importantly, participants were not told which appeals came from which source.

I measured three outcomes:
- Engagement: whether they would Dislike, feel Neutral, or Like each appeal
- Persuasiveness: how convincing they found each appeal on a 1-7 scale
- Donation behavior: actual monetary allocations from $0 to $0.10 per appeal"

---

## SLIDE 6: Analytical Approach (2 minutes)

"Because each participant evaluated multiple messages, I needed statistical methods that account for this nested structure.

For engagement, I used ordinal logistic mixed-effects regression — a cumulative link model — because the outcome has three ordered categories.

For persuasiveness, I used linear mixed-effects models since the composite score is continuous and approximately normally distributed.

For donation amounts, the data showed 35.3% zero donations, so I used a hurdle model. This separately models the decision to donate at all and the amount donated among those who gave.

All models included random intercepts for both participants and posts, and most importantly, they tested for Gender × Content Source interactions to answer my research questions."

---

## SLIDE 7: Model Selection Justification (1.5 minutes)

"Let me show you why I chose these specific models.

On the left, you see a Q-Q plot of the persuasiveness scores. The points follow the diagonal line closely, confirming the data is approximately normally distributed. This justifies using a linear mixed-effects model for this outcome.

On the right is a histogram of donation amounts. Notice the tall bar at zero — that's the 35.3% of participants who chose not to donate. This zero-inflation is what justified my use of a hurdle model, which separately handles the decision to donate from the amount given.

These diagnostic plots are important because using the wrong model type would lead to biased estimates and incorrect conclusions."

---

## SLIDE 8: Descriptive Statistics (1 minute)

"Before the main analysis, let me show you the distributions.

On the left, you can see engagement ratings. The 'Like' category dominates, especially for LLM content.

On the right, the persuasiveness scores. You can see the distributions are similar across conditions, with means around 5 on the 7-point scale. The approximate normality justified my use of linear models for this outcome."

---

## SLIDE 9: Main Effects - The LLM Advantage (2 minutes)

"The first major finding was unexpected.

LLM-generated appeals outperformed human-written appeals on every single outcome.

For engagement, LLM appeals had 58% higher odds of receiving a favorable rating, with p less than .001.

For persuasiveness, LLM appeals scored 0.2 points higher on the 7-point scale, again highly significant.

For donations, participants gave more money after reading LLM appeals, p equals .011.

This was consistent and statistically robust. Modern language models appear to produce persuasive content at a quality level that exceeds the average human writer."

---

## SLIDE 10: Gender Effects on Donation (1 minute)

"What about gender?

Among participants who donated, women gave significantly more than men — about $0.0013 more on average. This seems small, but it's meaningful given the $0.10 maximum.

This supports H2a: the established gender gap in giving replicated in this study.

However, gender did not predict whether someone donated at all. Men and women were equally likely to give something. The difference was only in how much they gave."

---

## SLIDE 11: Interaction - Engagement (2 minutes)

"Now to the core research question: do gender effects depend on content source?

For engagement, I found a significant interaction. The odds ratio was 1.53 with p equals .011.

Look at this graph. Both lines go up, meaning everyone preferred LLM content. But the line for women is steeper. Women's boost from LLM content was larger than men's.

This was actually the opposite of H3. I predicted women would prefer human content more, but in fact, women showed a stronger preference for LLM appeals at the engagement level."

---

## SLIDE 12: Interaction - Persuasiveness (1 minute)

"For persuasiveness, the interaction was not significant. p equals .428.

Although the graph shows a visible gap, the statistical test confirms the difference is not reliable. The effect of content source on persuasiveness did not differ between men and women.

H1 was not supported."

---

## SLIDE 13: Interaction - Donation (1 minute)

"For donation amounts, again no significant interaction. p equals .735.

Look at how parallel these lines are. Women donated more in both conditions, and LLM appeals led to higher donations for both genders. But the gap between men and women stayed the same.

H2b was not supported. The gender gap in generosity is consistent regardless of who — or what — wrote the appeal."

---

## SLIDE 14: Hypothesis Summary (1 minute)

"Let me summarize the hypothesis testing.

H1 predicted women would rate LLM content as less persuasive — not supported.

H2a predicted women donate more than men — supported.

H2b predicted a larger gender gap for human appeals — not supported.

H3 predicted women would prefer human content for engagement — not supported, and actually the opposite was found.

Only one hypothesis was confirmed, and the interaction I found for engagement went in the opposite direction of what I predicted."

---

## SLIDE 15: Discussion (2 minutes)

"How do I interpret these surprising results?

First, I think we're seeing a 'sincerity gap.' Gender differences appeared only for quick, automatic engagement reactions — not for deeper persuasiveness judgments or actual behavior. This fits with research on dual-process thinking, where first impressions use fast, intuitive processing.

Second, algorithm aversion was probably not activated. Participants weren't told about LLM authorship, so their skepticism of artificial content was never triggered. This suggests algorithm aversion is about the perceived identity of the source, not the linguistic features of the text itself.

Third, women's care orientation persists regardless of content source. Women's higher donations are triggered by distress signals in the message — and LLMs apparently mimic these signals effectively. The machine-generated text successfully triggered the relational cues that prompt prosocial responses."

---

## SLIDE 16: Practical Implications (1 minute)

"What does this mean for nonprofits?

LLMs can generate donation appeals that perform at least as well as human-written content. This is especially valuable for organizations with limited resources.

However, disclosure policies require caution. Research shows that labeling content as LLM-generated can reduce its impact. Organizations may face a trade-off between transparency and effectiveness.

The key takeaway: gender does not limit the value of LLMs in fundraising. Donors respond to content quality, not author identity."

---

## SLIDE 17: Limitations & Future Research (1.5 minutes)

"Of course, this study has limitations.

Most importantly, participants weren't told about LLM authorship. This means my findings apply to undisclosed contexts, not situations where organizations transparently label their content.

I only studied cancer charities. Results might differ for other causes or disaster relief.

The donation amounts were small — $0 to $0.10. Larger giving decisions might show different patterns.

And this was a U.S. sample, so cross-cultural replication would strengthen these findings.

For future research, I'd recommend testing these effects when LLM authorship is explicitly disclosed, exploring other charitable domains, and examining how these dynamics affect long-term donor relationships."

---

## SLIDE 18: Conclusion (1 minute)

"To conclude:

LLM-generated donation appeals outperformed human-written appeals on engagement, persuasiveness, and actual donations.

Gender differences do not limit the effectiveness of LLM-generated charitable appeals.

Women showed a stronger initial preference for LLM content, but this didn't translate to different persuasiveness judgments or donation amounts.

And women's higher generosity — the established gender gap in giving — persists regardless of whether a human or machine wrote the appeal."

---

## SLIDE 19: Thank You (30 seconds)

"Thank you for your attention. I'm happy to answer any questions you may have."

---

## TIMING SUMMARY

| Section | Slides | Time |
|---------|--------|------|
| Title | 1 | 1 min |
| Introduction/Problem | 2-3 | 4 min |
| Hypotheses | 4 | 2 min |
| Methods | 5-7 | 5.5 min |
| Results | 8-14 | 9 min |
| Discussion/Conclusion | 15-18 | 5.5 min |
| Thank You | 19 | 0.5 min |
| **Total** | **19** | **~27.5 min** |

---

## TIPS FOR DELIVERY

1. **Pace yourself** — Speak slowly and clearly, especially during the results
2. **Use the graphs** — Point to specific lines and trends as you explain
3. **Emphasize the surprise** — The opposite findings make for an engaging narrative
4. **Acknowledge limitations confidently** — This shows research maturity
5. **Make eye contact** — Connect with your committee members
6. **Practice transitions** — Smooth movement between slides keeps attention

