library(shiny)

fluidPage(
  titlePanel("Predicting Sepal and Petal Lengths"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("slidersepalwidth", "What is the sepal width of the flower?", 2 , 4.5 , step = 0.1 , value = 2.6),
      sliderInput("sliderpetalwidth", "what is the petal width of the flower?",0.1, 2.5 , step = 0.1 , value = 1.5),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
      submitButton("Submit")
    ),
    
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Sepal Length from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Petal Length from Model 2:"),
      textOutput("pred2")
    )
  )
)


