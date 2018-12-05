library(shiny)
ui <- fluidPage(
  numericInput(inputId = "n",
                 "Standard normal statistic", value = 0),
  textOutput(outputId = "V"),
  textOutput(outputId = "p")
)
server <- function(input, output) {
  output$p <- reactive({pnorm(input$n)})
  output$V <- renderText("P value = ")
}
shinyApp(ui = ui, server = server)