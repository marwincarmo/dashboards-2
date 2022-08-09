library(shiny)

dados <- readr::read_rds(here::here("dados/pkmn.rds"))

ui <- navbarPage(
  title = "Pokemon",
  tabPanel(
    title = "Grama",
    conteudo_ui("conteudo_grama", dados, "grama")
  ),
  
  tabPanel(
    title = "Agua",
    conteudo_ui("conteudo_agua", dados, "água")
  ),
  
  tabPanel(
    title = "Fogo",
    conteudo_ui("conteudo_fogo", dados, "fogo")
  )
)

server <- function(input, output, session) {
  
  conteudo_server("conteudo_grama", dados, "grama")
  
  conteudo_server("conteudo_agua", dados, "água")
  
  conteudo_server("conteudo_fogo", dados, "fogo")
  
}

shinyApp(ui, server)