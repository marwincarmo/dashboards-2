# Modulo histograma -------------------------------------------------------

histograma_ui <- function(id) {
  ns <- NS(id) # essa linha será igual no começo de toda ui de módulo
  tagList(
    
    selectInput(
      ns("variavel"),
      label = "Selecione a variável",
      choices = names(mtcars)
    ),
    br(),
    plotOutput(ns("grafico"))
    
  )
}

histograma_server <- function(id) {
  moduleServer(id, function(input, output, session){
    
    output$grafico <- renderPlot({
      hist(mtcars[[input$variavel]])
      
    })
    
  })
}