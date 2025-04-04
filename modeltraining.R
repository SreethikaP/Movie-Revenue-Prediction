library(dplyr)
library(randomForest)

imdb_movie_data <- read.csv("imdb_movie_dataset.csv")

# Clean column names
names(imdb_movie_data) <- make.names(names(imdb_movie_data))

# Select relevant features
imdb_movie_data <- imdb_movie_data %>%
  select(Rating, Votes, Revenue..Millions., Metascore, Runtime..Minutes., Year) %>%
  na.omit()

set.seed(123)
train_index <- sample(1:nrow(imdb_movie_data), 0.8 * nrow(imdb_movie_data))
train_data <- imdb_movie_data[train_index, ]
test_data <- imdb_movie_data[-train_index, ]

# Train model
rf_model <- randomForest(
  Revenue..Millions. ~ Votes + Metascore + Runtime..Minutes. + Year,
  data = train_data, ntree = 500, importance = TRUE
)

saveRDS(rf_model, "rf_model.rds")



