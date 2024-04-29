

library(rvest)
library(data.table)
library(xml2)
library(plyr)
library(purrr)
library(jsonlite)

t<-read_html("https://www.yachtworld.co.uk/yacht/1989-palmer-johnson-motorsailer-8587552/")
t %>% html_table()


all<-rbindlist(t %>% html_table())

t <- read_html('https://www.payscale.com/research/US/Job=Product_Manager%2C_Software/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)

##compaire 5 IT jobs(links) with other 5 jobs in a table
