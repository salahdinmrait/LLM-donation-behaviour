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

print("Levels of rating:")
print(levels(df$rating))

# Fit model (simplified for speed)
model <- clm(rating ~ gender * content_source, data = df)

# Predict
pred <- ggpredict(model, terms = c("content_source", "gender"))

print("Head of prediction object:")
print(head(pred))

print("Unique response levels in prediction:")
print(unique(pred$response.level))
