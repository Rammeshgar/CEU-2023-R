


library(shiny)

ui <- fluidPage(
  
  numericInput(inputId = "height",label = "your height in meter",value = 0),
  numericInput(inputId = "weight",label = "your_weight",value = 0),
  textOutput("BMI")
)

server <- function(input, output, session) {
  
  output$BMI<- renderText({
    paste("your_BMI_is",input$weight/(input$height*input$height))
  })
  
}

shinyApp(ui, server)