# Set local library path
lib_dir <- "C:/Users/smrai/Desktop/Bep/R_libs"
.libPaths(c(lib_dir, .libPaths()))

library(readr)
library(dplyr)
library(ordinal)
library(ggeffects)

# Load data
df <- read_csv("Data_LongFormat.csv")
df <- df %>%
  mutate(
    rating = factor(rating, levels = c("Dislike", "Neutral", "Like"), ordered = TRUE),
    gender = factor(gender, levels = c("Male", "Female")),
    content_source = factor(content_source, levels = c("Human", "LLM"))
  )

# Fit model
model <- clm(rating ~ gender * content_source, data = df)

# Predict
pred <- ggpredict(model, terms = c("content_source", "gender"))

# Convert to standard data frame to see all columns and types
pred_df <- as.data.frame(pred)

print("Structure of prediction data frame:")
str(pred_df)

print("Head of prediction data frame:")
print(head(pred_df))

print("Unique values in response.level:")
print(unique(pred_df$response.level))
