library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(
      "h1 {
        color: orange
      }"
    )
  ),
  h1("Título do meu app", align = "center", att = "a"),
  tags$h2("Subtítulo do app"),
  a(
    href = "https://curso-r.com",
    "Este é o link para o site da curso-r",
    target = "_blank" # abre em uma nova aba
  ),
  p("com algum texto", style = "color: red; font-size: 20pt;")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)