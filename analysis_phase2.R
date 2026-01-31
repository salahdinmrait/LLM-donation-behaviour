# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
.libPaths(c(lib_dir, .libPaths()))

library(readr)
library(dplyr)
library(ordinal)
library(sjPlot)
library(lme4)

# Load data
df <- read_csv("Data_LongFormat.csv")

# Preprocessing
df <- df %>%
  mutate(
    rating = factor(rating, levels = c("Dislike", "Neutral", "Like"), ordered = TRUE),
    gender = factor(gender, levels = c("Male", "Female")), # Male is reference
    content_source = factor(content_source, levels = c("Human", "LLM")), # Human is reference
    participant_id = as.factor(participant_id),
    post_id = as.factor(post_id)
  )

# Compute persuasiveness composite score
df$persuasiveness <- rowMeans(df[, c("persuasiveness_1", "persuasiveness_2", "persuasiveness_3")], na.rm = TRUE)

print("Data loaded and preprocessed.")

# Engagement Model (Ordinal Logistic Mixed-Effects Regression)
print("Fitting Engagement Model...")
model_engagement <- clmm(rating ~ gender + content_source + (1|participant_id) + (1|post_id), data = df)

print("Model Summary:")
summary(model_engagement)

# Extract Odds Ratios and CI
print("Odds Ratios:")
exp(coef(model_engagement))

print("Confidence Intervals:")
exp(confint(model_engagement))

# Save results to file
sink("phase2_results.txt")
print("--- Engagement Model Summary ---")
summary(model_engagement)
print("\n--- Odds Ratios ---")
print(exp(coef(model_engagement)))
print("\n--- Confidence Intervals ---")
print(exp(confint(model_engagement)))
sink()

print("Analysis complete. Results saved to phase2_results.txt.")

# Persuasiveness Model (Linear Mixed-Effects Regression)
print("Fitting Persuasiveness Model...")
model_persuasiveness <- lmer(persuasiveness ~ gender + content_source + (1|participant_id) + (1|post_id), data = df)

print("Model Summary:")
summary(model_persuasiveness)

# Save results to file (append)
sink("phase2_results.txt", append = TRUE)
print("\n\n--- Persuasiveness Model Summary ---")
summary(model_persuasiveness)
print("\n--- Coefficients (Fixed Effects) ---")
print(fixef(model_persuasiveness))
print("\n--- Confidence Intervals ---")
print(confint(model_persuasiveness, parm = "beta_", method = "Wald")) # Wald CI for speed
sink()

print("Persuasiveness analysis complete.")

# Donation Model (Hurdle Mixed-Effects Model)
print("Fitting Donation Model (Hurdle)...")
library(glmmTMB)

# Hurdle model:
# 1. Conditional model (amount | donation > 0): Gaussian (or Gamma)
# 2. Zero-inflation model (prob of 0): Logit
# Note: glmmTMB models the probability of ZERO.
# Thesis says: "binary logistic component predicts whether any donation occurs".
# Usually we interpret "probability of donating".
# If ziformula predicts prob of 0, then negative coef means higher prob of donating.
# We will check the output.

model_donation <- glmmTMB(donation_amount ~ gender + content_source + (1|participant_id) + (1|post_id),
                          ziformula = ~ gender + content_source,
                          family = gaussian,
                          data = df)

print("Model Summary:")
summary(model_donation)

# Save results to file (append)
sink("phase2_results.txt", append = TRUE)
print("\n\n--- Donation Model Summary (Hurdle) ---")
summary(model_donation)

print("\n--- Conditional Model (Amount) Coefficients ---")
print(fixef(model_donation)$cond)
print("\n--- Conditional Model CI ---")
print(confint(model_donation, parm = "beta_", method = "Wald"))

print("\n--- Zero-Inflation Model (Prob of 0) Coefficients ---")
print(fixef(model_donation)$zi)
print("\n--- Zero-Inflation Model Odds Ratios (Prob of 0) ---")
print(exp(fixef(model_donation)$zi))
# To get Prob of Donating, we invert the relationship or interpret carefully.
# OR > 1 means higher prob of ZERO (less likely to donate).
# OR < 1 means lower prob of ZERO (more likely to donate).

sink()

print("Donation analysis complete.")
