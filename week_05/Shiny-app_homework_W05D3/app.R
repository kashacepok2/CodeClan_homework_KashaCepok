library(shiny)
library(tidyverse)
library(bslib)

game_sales <- CodeClanData::game_sales

name_choices <- game_sales %>% distinct(name) %>% pull()

ui <- fluidPage(
  titlePanel(tags$h1("Game Scores App")),
  theme = bs_theme(bootswatch = "lux"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "game_input",
        label = "Which game?",
        choices = name_choices
      )
    ),
    mainPanel(
      plotOutput("game_plot")
    )
  )
)
  
server <- function(input, output, session) {
  
  output$game_plot <- renderPlot(expr ={
    game_sales %>% 
      mutate(user_score = user_score*10) %>% 
      pivot_longer(cols = "critic_score":"user_score",
                   names_to = "critic_or_user",
                   values_to = "score") %>%
      filter(name == input$game_input) %>% 
      ggplot() +
      aes(x = input$game_input, y = score, fill = critic_or_user) +
      geom_col(position = "dodge")
  })
}

shinyApp(ui, server)