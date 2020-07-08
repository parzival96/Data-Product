library(shiny)

function(input, output) {
  
  # Fit Models
  model1 <- lm(Sepal.Length ~ Sepal.Width , data = iris)
  model2 <- lm(Petal.Length ~ Petal.Width , data = iris)
  
  model1pred <- reactive({
    SepalwidthInput <- input$slidersepalwidth
    predict(model1, newdata = data.frame(Sepal.Width = SepalwidthInput))
  })
  
  model2pred <- reactive({
    PetalwidthInput <- input$sliderpetalwidth
    predict(model2, newdata = 
              data.frame(Petal.Width = PetalwidthInput))
  })
  
  output$plot1 <- renderPlot({
    SepalwidthInput <- input$slidersepalwidth
    PetalwidthInput <- input$sliderpetalwidth
    
    if(input$showModel1){
      
      plot(iris$Sepal.Width , iris$Sepal.Length , xlab = "Sepal width" ,
           ylab = "Sepal Length",bty = "n", pch = 16 , xlim = c(2,4.5) , ylim = c(3,7))
      
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){
      
      plot(iris$Petal.Width , iris$Petal.Length , xlab = "Petal Width" ,
           ylab = "Petal Length", bty = "n", pch = 16,xlim = c(0.1,3.5) ,ylim = c(1,7))
      
      abline(model2 , col = "blue", lwd = 2)
    }
    legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
           col = c("red", "blue"), bty = "n", cex = 1.2)
    points(SepalwidthInput, model1pred(), col = "red", pch = 16, cex = 2)
    points(PetalwidthInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
}