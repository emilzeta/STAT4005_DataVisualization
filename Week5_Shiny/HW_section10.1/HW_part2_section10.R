library(tidyverse)
library(shiny)


ui1 <- fluidPage(
  numericInput("a",
               label = "Number a",
               value = 1),
  numericInput("b", 
               label = "Number b",
               value = 1),
  numericInput("d",
               label = "Number d",
               value = 1),
  textOutput("f")
  
)

server1 <- function(input, output, session) {
  c <- reactive(input$a + input$b)
  e <- reactive(c() + input$d)
  output$f <- renderText(e())
}



shinyApp(ui1, server1)

####

library(shiny)

ui2 <- fluidPage(
  numericInput("x1", 
               label  = "x1",
               value = 1),
  numericInput("x2", 
               label = "x2",
               value = 1),
  numericInput("x3", 
               label = "x3",
               value = 1)
)

server2 <- function(input, output, session) {
  x <- reactive(input$x1 + input$x2 + input$x3)
  y <- reactive(input$y1 + input$y2)
  output$z <- renderText(x() / y())
}

shinyApp(ui, server)