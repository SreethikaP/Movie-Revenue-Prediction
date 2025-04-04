library(shiny)
library(shinythemes)
library(shinyWidgets)
library(httr)
library(jsonlite)

ui <- fluidPage(
  theme = shinytheme("cosmo"),  # Apply a nice theme
  titlePanel("🎬 Movie Revenue Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Enter Movie Details"),
      
      sliderInput("votes", "IMDB Votes:", min = 1000, max = 500000, value = 100000, step = 1000),
      numericInput("metascore", "Metascore:", value = 70, min = 1, max = 100),
      numericInput("runtime", "Runtime (Minutes):", value = 120, min = 60, max = 240),
      pickerInput("year", "Select Year:", choices = 2000:2025, selected = 2020, multiple = FALSE),
      
      actionButton("predict", "🎬 Predict Revenue", class = "btn-primary")
    ),
    
    mainPanel(
      h3("Prediction Result"),
      verbatimTextOutput("prediction_output"),
      tags$br(),
      tags$p("⚡ Powered by Machine Learning")
    )
  )
)

server <- function(input, output, session) {
  
  library(randomForest)  # Ensure the package is loaded
  
  # Load the trained model when the app starts
  model <- tryCatch({
    readRDS("rf_model.rds")
  }, error = function(e) {
    print("Error: Could not load the model.")
    return(NULL)
  })
  
  
  # Check the model class after loading
  print("Model loaded:")
  print(class(model))
  
  
  observeEvent(input$predict, {
    req(input$votes, input$metascore, input$runtime, input$year)
    
    # Ensure model is loaded correctly
    if (is.null(model)) {
      output$prediction_output <- renderText("Model failed to load.")
      return()
    }
    
    # Prepare the data for prediction
    new_data <- data.frame(
      Votes = input$votes,
      Metascore = input$metascore,
      Runtime..Minutes. = input$runtime,
      Year = input$year
    )
    
    print("Data for prediction:")
    print(new_data)
    
    # Try to make a prediction
    predicted_value <- tryCatch({
      predict(model, newdata = new_data)
    }, error = function(e) {
      print("Prediction failed due to an error:")
      print(e$message)  # Print error message
      return(NA)
    })
    
    # Handle prediction results
    if (is.na(predicted_value)) {
      output$prediction_output <- renderText("Prediction failed. Please check the input data.")
    } else {
      # Display predicted revenue
      output$prediction_output <- renderText({
        paste("Predicted Revenue: $", round(predicted_value, 2), "Million")
      })
    }
  })
}

shinyApp(ui, server)


