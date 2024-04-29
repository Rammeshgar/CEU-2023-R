library(shiny)
library(ggplot2)
library(data.table)
library(jsonlite)

#___________function for data table

get_coin_df <- function(coin, coindays) {
  
  df <- data.table(fromJSON(paste0('https://api.coingecko.com/api/v3/coins/',coin,'/ohlc?vs_currency=usd&days=',coindays), simplifyDataFrame = T))
  
  names(df) <- c('time', 'open', 'high','low','close')
  
  
  df$time <- as.POSIXct((df$time/1000), origin="1970-01-01")
  return(df)
}

#______________function for plot

getCoinPlot <- function(coindf) {
  
  
  result <- ggplot(coindf,aes(x=time, y=close))+
    geom_line()+
    theme_bw()
  
  return(result)
  
}

#___________function for  getting all coins

get_coin_list  <- function() {
  df <- fromJSON('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en')
  df <- df[c('id', 'name')]
  return(df)
}

ui <- fluidPage(
  
  uiOutput("selector_out"),
  
  plotOutput('crypto_plot'),
  
  selectInput("coindays", label = h3("select amount of days"),choices = c(1,7,14,30)),
  
  tableOutput("coindfout")
  
  #tableOutput('coin_list_out')
  
)

server <- function(input, output, session) {
  
  coin_list_df <- get_coin_list()
  #output$coin_list_out <- renderTable(coin_list_df)
  
  actualcoindf<-reactive({
    get_coin_df(input$coin,input$coindays)
  })
  
  
  output$selector_out<-renderUI({
    selectInput("coin", "Select a coin",
               setNames( coin_list_df$id,coin_list_df$name),selected = "bitcoin")
  })
  
  
  output$crypto_plot <-renderPlot({ 
    getCoinPlot(actualcoindf())
  })
  
  output$coindfout<-renderTable({
    actualcoindf()
    })
  
}

shinyApp(ui, server)
