library(shiny)
library(tidyverse)

# The idea of the app is to investigate whether critic scores are a good predictor of how successful a game will be.
# Here we use total game sales (up to the point the data was taken) as a metric for success. Generally speaking,
# if a point is in the top left or bottom right quartile's of the graph - ie, low critic score but high sales, or 
# high critic score but low in sales - we can say that the critic rating is wrong. The user can filter for years 
# and genre's to break down the data as there are a lot of games in the dataset.

game_sales <- CodeClanData::game_sales
genres <- game_sales %>% distinct(genre) %>%  pull()
years <- game_sales %>% distinct(year_of_release) %>% pull()

ui <- fluidPage(
  titlePanel("Are Critics Always Right?"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "genre_input",
        label = "Genre of games",
        choices = genres
      ),
      selectInput(
        inputId = "year_input",
        label = "Year of Release",
        choices = years
      )
    ),
    mainPanel(plotOutput("scatter_plot"))
  )
)

server <- function(input, output, session) {
  output$scatter_plot <- renderPlot( 
    game_sales %>% 
    filter(year_of_release == input$year_input) %>% 
    filter(genre == input$genre_input) %>% 
    ggplot() +
    aes(x = critic_score, y = sales, colour = sales) +
    geom_point() +
    labs(title = "Critic Scores vs Cumulative Sales",
         x = "Critic Scores out of 100",
         y = "Total Sales in Millions")
)}

shinyApp(ui, server)