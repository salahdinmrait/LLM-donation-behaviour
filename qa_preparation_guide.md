# Q&A Preparation Guide
## Thesis Defense: Gender Differences in LLM-Generated Donation Appeals

---

# METHODOLOGY QUESTIONS

## Q: Why did you choose a hurdle model for donation data?
**A:** The donation data had 35.3% zeros — people who chose not to donate at all. A standard linear model would struggle with this because it can't distinguish between "decided not to give" and "gave a small amount." The hurdle model treats these as two separate decisions:
1. **Binary component:** Did they donate or not? (logistic regression)
2. **Conditional component:** Given that they donated, how much? (truncated normal)

This mirrors the actual psychology: first you decide whether to give, then you decide how much.

## Q: Why use ordinal logistic regression for engagement?
**A:** Engagement has three ordered categories: Dislike < Neutral < Like. A regular linear regression would incorrectly assume equal distances between categories (e.g., that Neutral-to-Like is the same "distance" as Dislike-to-Neutral). The cumulative link model respects the ordering while modeling the probability of crossing each threshold.

## Q: Why include random effects for both participants AND posts?
**A:** The data has two sources of clustering:
- **Participants:** Each person rated 6 appeals, so their responses are correlated (some people are generally more positive)
- **Posts:** Each appeal was rated by multiple participants, so ratings of the same post are correlated (some appeals are inherently better)

Ignoring either source would underestimate standard errors and inflate Type I error rates.

## Q: Why use mixed-effects models instead of simpler approaches?
**A:** With 4,350 observations nested within 725 participants, the independence assumption of standard regression is violated. Mixed-effects models:
- Account for individual differences in baseline responding
- Produce correct standard errors
- Have more statistical power than aggregating to participant means

## Q: What was Cronbach's alpha for persuasiveness and why does it matter?
**A:** Cronbach's α = 0.89, indicating excellent internal consistency. This justified combining the three 7-point Likert items into a single composite score. If alpha had been low, the items might be measuring different constructs and shouldn't be combined.

## Q: Why was "Male" the reference category for gender?
**A:** This was a deliberate choice to directly test whether female participants showed different patterns. With Male as reference, the Gender coefficient directly answers: "How do women differ from men?" Using Female as reference would give mathematically equivalent results but with reversed signs.

---

# CITED RESEARCH QUESTIONS

## Q: Can you explain the algorithm aversion research (Dietvorst et al., 2015)?
**A:** Dietvorst and colleagues found that people rapidly lose trust in algorithms after seeing them make mistakes — more so than when humans make identical errors. In forecasting tasks, participants preferred human judgment even when algorithms were demonstrably more accurate. This is irrational but psychologically robust.

**Relevance to my study:** I expected this aversion to apply to LLM-generated emotional content, predicting women (who value authenticity more) would show stronger negative reactions.

## Q: What is the dual-process explanation (Li et al., 2025)?
**A:** Li and colleagues showed that people use different cognitive modes when evaluating LLM content:
- **System 1 (fast):** Quick, intuitive reactions to surface features like tone and fluency
- **System 2 (slow):** Deliberate evaluation requiring effort and reflection

First impressions of LLM content are often formed through fast processing. My engagement results (fast reaction) showed gender differences, while persuasiveness (requires evaluation) did not — consistent with this framework.

## Q: What did Wenger et al. (2024) find about LLM empathy?
**A:** Wenger's team found a paradox: LLM-generated empathic responses were rated higher than human responses on comfort, validation, and emotional understanding. Yet when given a choice, people still preferred to seek empathy from humans.

**Relevance:** This explains my "sincerity gap" — LLMs can trigger strong emotional reactions without fully replacing human preference at a reflective level.

## Q: How does Gilligan's (1982) care ethics relate to your findings?
**A:** Gilligan proposed that women tend toward a "Care" moral orientation focused on relationships and preventing harm, while men lean toward a "Justice" orientation focused on rules and fairness.

**Relevance:** Women's higher donations reflect this care orientation. My findings show this persists for LLM content because the machine-generated text still contains distress signals that trigger care-based responding.

## Q: What is Moral Foundations Theory (Graham et al., 2011)?
**A:** MFT identifies five (later six) psychological foundations of morality. The "Harm/Care" foundation — sensitivity to suffering and impulse to care for others — shows reliable gender differences, with women scoring higher.

**Relevance:** This provides the psychological mechanism for why women donate more and why this persists regardless of content source — the content still signals harm/need, triggering the foundation.

## Q: What did Yin et al. (2024) find about disclosure?
**A:** Yin, Jia, and Wakslak found that the perceived effectiveness of empathic responses drops significantly when people know the source is an LLM. The same text is evaluated differently based on attributed authorship.

**Relevance:** Since my participants weren't told about authorship, algorithm aversion wasn't activated. My findings apply to undisclosed contexts but might differ with transparency.

## Q: What is Schoenegger et al.'s (2025) finding on LLM persuasion?
**A:** Schoenegger and colleagues showed that modern LLMs can outperform human persuaders — even when humans are financially incentivized to be convincing. This was demonstrated across multiple persuasion contexts.

**Relevance:** This explains why LLM content outperformed human content in my study. It's not surprising anymore that LLMs achieve high persuasive quality.

---

# RESULTS INTERPRETATION QUESTIONS

## Q: Why did you find the opposite of what you predicted for engagement?
**A:** Three possible explanations:
1. **LLM linguistic quality:** LLMs produce consistently fluent, well-structured emotional appeals that trigger positive automatic responses
2. **Undisclosed authorship:** Without knowing the source, participants couldn't apply their skepticism
3. **Surface vs. deep processing:** Women's sensitivity may actually make them more responsive to the smooth emotional tone LLMs produce at the surface level

## Q: If H1, H2b, and H3 weren't supported, does your research fail?
**A:** No — null results are findings too. Discovering that gender does NOT moderate LLM effectiveness (except for engagement) is practically important. Nonprofits can use LLMs without worrying about alienating female donors. The supported H2a (women donate more) replicated an established finding, validating the methodology.

## Q: The interaction for engagement was significant but small (OR=1.53). Is it meaningful?
**A:** Yes, for several reasons:
1. Odds ratios of 1.5 are considered medium effects in social science
2. At scale (millions of potential donors), even small differences matter
3. The direction was unexpected, which is theoretically interesting
4. It was robust to multiple specifications with random effects

## Q: Why didn't engagement differences translate to donation differences?
**A:** This is the "sincerity gap" in action. Engagement captures fast, automatic reactions. Donation requires:
- Deliberate evaluation
- Financial decision-making
- Actual behavioral commitment

The gender difference at the intuitive level "washes out" by the time people make actual giving decisions. This is consistent with dual-process theories.

---

# DESIGN & VALIDITY QUESTIONS

## Q: Why weren't participants told about LLM authorship?
**A:** This was the original study design. The goal was to test responses to the text itself, without confounding from attitudes toward AI. However, this is also a limitation — my findings don't generalize to contexts where organizations disclose LLM use.

## Q: Is $0.00-$0.10 a realistic donation amount?
**A:** It's small but methodologically valid:
- Micro-donations are common in behavioral economics experiments
- Real money creates real incentives
- Relative differences still provide valid insights

However, I acknowledge effects might differ for larger giving decisions.

## Q: How do you know the appeals were actually different in quality?
**A:** I didn't have the original appeal texts, so I can't verify specific linguistic features. However:
- The significant main effects show participants did perceive differences
- The within-subjects design controlled for individual differences
- Both conditions had the same charities, just different authorship

## Q: Only 725 participants — is this enough?
**A:** Yes, for several reasons:
- 4,350 observations after accounting for the nested structure
- Adequate power for detecting medium effects
- Significant results where found were robust
- Non-significant results had reasonable precision (confidence intervals weren't extremely wide)

---

# THEORETICAL QUESTIONS

## Q: Does this mean algorithm aversion doesn't exist?
**A:** No — it means algorithm aversion requires knowledge of algorithmic authorship. My study shows that:
- Algorithm aversion is about perceived identity, not linguistic features
- If you don't tell people it's AI, they respond to the text quality
- This has implications for disclosure policies

## Q: Why might women prefer LLM content MORE at the engagement level?
**A:** Possible mechanisms:
1. **Emotional smoothness:** LLMs produce consistently polished emotional language
2. **Higher sensitivity works both ways:** Women's sensitivity to emotional cues might make them more responsive to high-quality emotional signaling
3. **Absence of human writer variability:** Human writers have bad days; LLMs are consistently good

## Q: What does this mean for the "human touch" in fundraising?
**A:** The human touch may matter when:
- Authorship is disclosed
- Long-term relationships are being built
- Donors have personal connections to the organization

For initial cold outreach (like social media appeals), LLM content appears sufficient or even superior.

---

# PRACTICAL APPLICATION QUESTIONS

## Q: Should nonprofits use LLMs for donation appeals?
**A:** Based on my findings, yes — with caveats:
- LLM content performed at least as well as human content
- Cost and time savings could be substantial
- BUT: Results assume non-disclosure
- Ethical considerations around transparency may override effectiveness

## Q: What about donor trust in the long term?
**A:** Unknown from this study. If donors later discover they were persuaded by LLM content without knowing, it might damage trust. This is a question for future research.

## Q: What if regulations require disclosure?
**A:** Many jurisdictions are considering AI disclosure requirements. Based on Yin et al.'s research, disclosure would likely reduce effectiveness. Organizations may need to:
- Accept reduced effectiveness for transparency
- Find ways to frame disclosure positively
- Invest in hybrid human-AI approaches

---

# FUTURE RESEARCH QUESTIONS

## Q: What would you do differently in a follow-up study?
**A:** Key modifications:
1. **Add disclosure condition:** Test disclosed vs. undisclosed LLM authorship
2. **Vary domains:** Test other charitable causes beyond cancer
3. **Larger donations:** Use more realistic giving amounts
4. **Longitudinal design:** Track long-term donor behavior
5. **Qualitative component:** Interview participants about their reasoning

## Q: How would you test the "sincerity gap" more directly?
**A:** I would:
1. Measure both implicit (reaction time) and explicit attitudes
2. Include manipulation checks for perceived sincerity
3. Test whether the gap varies with time pressure
4. Use eye-tracking to see what people focus on
