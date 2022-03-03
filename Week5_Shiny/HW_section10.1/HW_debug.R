

## Question 1

library(shiny)
library(tidyverse)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

#The inputId has to be combined with an output command and to call the inputID you have to pair it with and input command
server1 <- function(input, output, server) {
  output$greeting <- renderText(paste0("Hello ", input$name))
}

# The "greeting" has to be a reactive()
server2 <- function(input, output, server) {
  greeting <- reactive({
    paste0("Hello ", input$name)
  })
  output$greeting <- renderText(greeting())
}


#An "e" is missing form the inputId and the render function is missing
server3 <- function(input, output, server) {
  output$greeting <- renderText(paste0("Hello", input$name))
}

shinyApp(ui, server1)
shinyApp(ui, server2)
shinyApp(ui, server3)


#####

## Question 2

