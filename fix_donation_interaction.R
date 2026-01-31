# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
.libPaths(c(lib_dir, .libPaths()))

library(readr)
library(dplyr)
library(lme4)
library(sjPlot)
library(ggplot2)

# Load data
df <- read_csv("Data_LongFormat.csv")

# Preprocessing
df <- df %>%
  mutate(
    gender = factor(gender, levels = c("Male", "Female")),
    content_source = factor(content_source, levels = c("Human", "LLM")),
    participant_id = as.factor(participant_id),
    post_id = as.factor(post_id)
  )

# Filter for donors only
df_donors <- df %>% filter(donation_amount > 0)

print(paste("Number of donors:", nrow(df_donors)))

# Fit LMM on Donation Amount (Interaction)
# We use raw amount first, then maybe log if needed. Thesis used raw in Phase 2.
print("Fitting Donation Interaction Model (LMM on Donors)...")
model_donation_int_lmer <- lmer(donation_amount ~ gender * content_source + (1|participant_id) + (1|post_id), data = df_donors)

print("Model Summary:")
summary(model_donation_int_lmer)

print("Coefficients:")
print(fixef(model_donation_int_lmer))

print("Confidence Intervals:")
print(confint(model_donation_int_lmer, parm = "beta_", method = "Wald"))

# Plot Interaction
p3 <- plot_model(model_donation_int_lmer, type = "pred", terms = c("content_source", "gender"),
           title = "Interaction Effect on Donation Amount (Donors)", axis.title = "Donation Amount ($)",
           legend.title = "Gender")
ggsave("interaction_donation_fixed.png", plot = p3, width = 8, height = 6)

# Save results
sink("phase3_donation_fix.txt")
print("--- Donation Interaction Model (LMM on Donors) ---")
summary(model_donation_int_lmer)
print("\nCoefficients:")
print(fixef(model_donation_int_lmer))
sink()
