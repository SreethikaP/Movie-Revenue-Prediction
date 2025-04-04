# 🎬 Movie Revenue Prediction App
## 📌 Project Structure:
📁 project/
├── app.R                 # Shiny App UI + Server
├── rf_model.rds          # Trained Random Forest Model
├── imdb_movie_dataset.csv # Original dataset
└── README.md             # Project documentation

This Shiny app predicts the revenue (in millions) of a movie based on features like IMDb votes, metascore, runtime, and year using a trained Random Forest model.

## 🔍 Features
- Clean and interactive UI with `shinythemes` and `shinyWidgets`
- Predict revenue for a movie using a trained ML model
- Deployed on [ShinyApps.io] ([https://64pj3f-padala-sreethika.shinyapps.io/project/])

## 📊 Technologies Used
- R, Shiny
- Random Forest (from `randomForest` package)
- UI Enhancements: `shinythemes`, `shinyWidgets`

## 🚀 How to Run Locally
```r
# Clone the repo and set working directory
shiny::runApp("app.R")
