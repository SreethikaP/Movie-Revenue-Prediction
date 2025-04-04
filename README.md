# 🎬 Movie Revenue Prediction App
## 📌 Project Structure:
```
📂 project/
│-- app.R                    # Shiny App UI + Server
│-- rf_model.rds             # Trained Random Forest Model
│-- imdb_movie_dataset.csv   # Original dataset
│-- README.md                # Project documentation

```



---

## 🔍 Features

- 🎨 Clean and interactive UI with `{shinythemes}` and `{shinyWidgets}`
- 🤖 Predict movie revenue using a trained machine learning model
- ☁️ Deployed on ShinyApps.io for public access

🔗 **Live App:** [Click here to view on ShinyApps.io](https://64pj3f-padala-sreethika.shinyapps.io/project/)

---

## 📊 Technologies Used

- **Programming Language**: R
- **Web Framework**: [Shiny](https://shiny.posit.co/)
- **Modeling**: `randomForest` (Regression)
- **UI Libraries**: `shinythemes`, `shinyWidgets`

---

## 🚀 How to Run Locally

Make sure you have R and RStudio installed. Then:

1. Clone the repository or download the project folder:

```bash
git clone https://github.com/SreethikaPadala/Movie-Revenue-Predictor.git
```
2. Open the project in RStudio.
3. Run the app from the R console:
```r
shiny::runApp("app.R")
```

## 📦 Required Packages
```r
install.packages(c("shiny", "shinythemes", "shinyWidgets", "randomForest", "jsonlite", "httr", "dplyr"))
```

## 🛠️ Model Training Overview

The **rf_model.rds** file was created using the **randomForest** package. Features used:

1. Votes
2. Metascore
3. Runtime..Minutes.
4. Year

## ▶️ Usage

1. Launch the App (locally or via the provided ShinyApps.io link).
2. Enter movie details:
    IMDb Votes (e.g., 100000)
    Metascore (e.g., 70)
    Runtime (e.g., 120 minutes)
    Year (e.g., 2020)
3. Click on "🎬 Predict Revenue".
4. View the predicted revenue (in millions) instantly!

##  Future Enhancements

1. Add more input features like genre, director, or actors.
2. Include model performance metrics in the app.
3. Deploy using Docker or on cloud platforms (e.g., AWS).
4. Enable API-based prediction using Plumber.

