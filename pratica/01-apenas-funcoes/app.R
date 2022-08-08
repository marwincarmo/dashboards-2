library(shiny)

imdb <- readr::read_rds(here::here("dados/imdb.rds"))

opcoes <- imdb |> 
  dplyr::pull(generos) |> 
  stringr::str_split(", ") |> 
  unlist() |> 
  unique() |> 
  sort()
# tentar fazer com a funcao tidyr::separate_rows()

ui <- fluidPage(
  sidebarLayout(
    h1("IMDB"),
    sidebarPanel(
      selectInput(
        "generos",
        label = "Selecione um gênero",
        choices = opcoes
      )
    ),
    mainPanel(
      plotOutput("grafico1"),
      plotOutput("grafico2")
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)

