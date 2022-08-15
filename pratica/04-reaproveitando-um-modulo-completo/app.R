library(shiny)

dados <- readr::read_rds(here::here("dados/pkmn.rds"))

ui <- navbarPage(
  title = "Pokemon",
  id = "menu"

)

server <- function(input, output, session) {
  
  purrr::walk(
    unique(dados$tipo_1),
    ~ appendTab(
      inputId = "menu",
      tab = tabPanel(
        title = stringr::str_to_title(.x),
        conteudo_ui(abjutils::rm_accent(.x), dados, .x)
      ),
      select = ifelse(.x == "grama", TRUE, FALSE)
      
    )
  )
  
  purrr::walk(
    unique(dados$tipo_1),
    ~ conteudo_server(abjutils::rm_accent(.x), dados, .x)
  )
  
  conteudo_server("conteudo_agua", dados, "água")
  
}

shinyApp(ui, server)