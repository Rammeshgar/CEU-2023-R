library(shiny)

ui <- fluidPage(
  numericInput(inputId = "first_number", label = "Write first number",value = 1),
  numericInput(inputId = "second_number",label = "write second number",value = 1),
  textOutput("Here_is_the_result")
)

server <- function(input, output, session) {
  output$Here_is_the_result<-renderText({
    paste0("here is the result", input$first_number+input$second_number)
  })
}

shinyApp(ui, server)