

library(rvest)
library(data.table)
library(xml2)
library(plyr)
library(purrr)
library(jsonlite)

###1
t<-read_html("https://www.payscale.com/research/US/Job=Data_Analyst/Salary")
t %>% html_table()


all<-rbindlist(t %>% html_table())

t <- read_html('https://www.payscale.com/research/US/Job=Data_Analyst/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)
###2

t<-read_html('https://www.payscale.com/research/US/Job=Business_Analyst%2C_IT/Salary')
t %>% html_table()


all<-rbindlist(t %>% html_table())

t <- read_html('https://www.payscale.com/research/US/Job=Business_Analyst%2C_IT/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)
###3

t <- read_html('https://www.payscale.com/research/US/Job=Financial_Analyst/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)
###4

t <- read_html('https://www.payscale.com/research/US/Job=Senior_Financial_Analyst/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)
###5

t <- read_html('https://www.payscale.com/research/US/Job=Software_Developer/Salary')


td  <- fromJSON(t %>%
                  html_nodes(xpath = "//script[@type='application/json']")%>%
                  html_text(),simplifyDataFrame = F
)
td$props$pageProps$pageData$byDimension$`Job by Location`$rows[[6]]$range

toJSON(td, auto_unbox = T)