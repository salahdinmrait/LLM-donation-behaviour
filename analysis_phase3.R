# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
.libPaths(c(lib_dir, .libPaths()))

library(readr)
library(dplyr)
library(ordinal)
library(sjPlot)
library(lme4)
library(glmmTMB)
library(ggplot2)

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

# Initialize results file
sink("phase3_results.txt")
print("--- Phase 3: Interaction Analysis ---")
sink()

# --- 1. Engagement Model (Interaction) ---
print("Fitting Engagement Interaction Model...")
model_engagement_int <- clmm(rating ~ gender * content_source + (1|participant_id) + (1|post_id), data = df)

sink("phase3_results.txt", append = TRUE)
print("\n\n--- Engagement Interaction Model ---")
summary(model_engagement_int)
print("\nOdds Ratios:")
print(exp(coef(model_engagement_int)))
sink()

# Plot Interaction (Only "Like" Probability)
library(ggeffects)
pred_engagement <- ggpredict(model_engagement_int, terms = c("content_source", "gender"))

# Filter for "Like" level (which is level 3)
# Convert to data frame to ensure standard behavior
pred_engagement <- as.data.frame(pred_engagement)
# Filter for level 3 (Like). Check both character "3" and numeric 3 to be safe.
pred_engagement_like <- pred_engagement %>% filter(response.level == "3" | response.level == 3)

p1 <- ggplot(pred_engagement_like, aes(x = x, y = predicted, color = group, group = group)) +
  geom_point(position = position_dodge(0.2), size = 3) +
  geom_line(position = position_dodge(0.2), linewidth = 1) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.1, position = position_dodge(0.2)) +
  labs(title = "Interaction Effect on Engagement (Probability of 'Like')",
       y = "Predicted Probability of 'Like'",
       x = "Content Source",
       color = "Gender") +
  theme_sjplot()

ggsave("interaction_engagement_like.png", plot = p1, width = 8, height = 6)


# --- 2. Persuasiveness Model (Interaction) ---
print("Fitting Persuasiveness Interaction Model...")
model_persuasiveness_int <- lmer(persuasiveness ~ gender * content_source + (1|participant_id) + (1|post_id), data = df)

sink("phase3_results.txt", append = TRUE)
print("\n\n--- Persuasiveness Interaction Model ---")
summary(model_persuasiveness_int)
print("\nCoefficients:")
print(fixef(model_persuasiveness_int))
sink()

# Plot Interaction
p2 <- plot_model(model_persuasiveness_int, type = "pred", terms = c("content_source", "gender"),
           title = "Interaction Effect on Persuasiveness", axis.title = "Persuasiveness Score",
           legend.title = "Gender")
ggsave("interaction_persuasiveness.png", plot = p2, width = 8, height = 6)


# --- 3. Donation Model (Interaction) ---
print("Fitting Donation Interaction Model...")
# Using simplified ZI formula as per Phase 2 fix
model_donation_int <- glmmTMB(donation_amount ~ gender * content_source + (1|participant_id) + (1|post_id),
                          ziformula = ~ gender + content_source, 
                          family = gaussian,
                          data = df)

sink("phase3_results.txt", append = TRUE)
print("\n\n--- Donation Interaction Model ---")
summary(model_donation_int)
sink()

# Plot Interaction (Conditional Model - Amount)
p3 <- plot_model(model_donation_int, type = "pred", terms = c("content_source", "gender"),
           title = "Interaction Effect on Donation Amount (Donors)", axis.title = "Donation Amount ($)",
           legend.title = "Gender")
ggsave("interaction_donation.png", plot = p3, width = 8, height = 6)

print("Phase 3 analysis complete. Results saved to phase3_results.txt and plots generated.")
