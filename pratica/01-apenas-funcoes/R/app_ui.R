app_ui <- function(imdb) {
  
  opcoes <- imdb |> 
    dplyr::pull(generos) |> 
    stringr::str_split(", ") |> 
    unlist() |> 
    unique() |> 
    sort()
  # tentar fazer com a funcao tidyr::separate_rows()
  
  tagList( # cada argumento da função é passado um codigo que devolve html
    h1("IMDB"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "genero",
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
  
}