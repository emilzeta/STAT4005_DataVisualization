library(tidyverse)
library(here)
library(shiny)

athletes_df <- read_csv(here("data/athletesdata.csv"))

ggplot(data = athletes_df, aes(x = salary)) +
  geom_histogram()

ui <- fluidPage(
  sidebarLayout(sidebarPanel(
    selectizeInput("sportchoice", 
                   label = "Choose a Sport",
                   choices = levels(factor(athletes_df$Sport)),
                   selected = "Football"),
    sliderInput("binnumber", 
                 label = "Number of Bins",
                 value = 20,
                 min = 3,
                 max = 40)),
    mainPanel(plotOutput("histgraph"))
))

server <- function(input, output, session) {
  
  athletes_sub <- reactive({
    athletes_df %>%
      filter(Sport == input$sportchoice)
  })
  
  hist_plot <- reactive({
    ggplot(athletes_sub(), aes(x = salary)) +
      geom_histogram(colour = "black", 
                     fill = "white",
                     bins = input$binnumber)
  })
  output$histgraph <-  renderPlot({
    hist_plot()
  })
}

shinyApp(ui, server)
