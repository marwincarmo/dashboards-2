library(shiny)
library(ggplot2)

imdb <- readr::read_rds(here::here("dados/imdb.rds"))

ui <- fluidPage(
  app_ui(imdb)
)

server <- app_server

shinyApp(ui, server)

