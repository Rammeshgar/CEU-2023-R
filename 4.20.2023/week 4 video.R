

library(rvest)
library(data.table)
library(xml2)
library(plyr)
library(jsonlite)
require(httr)

get_page_coin <- function(pagenum) {
  headers = c(
    `accept` = "application/json"
  )
  
  params = list(
    `vs_currency` = "usd",
    `order` = "market_cap_desc",
    `per_page` = "100",
    `page` = as.character(pagenum),
    `sparkline` = "false",
    `locale` = "en"
  )
  
  res <- httr::GET(url = "https://api.coingecko.com/api/v3/coins/markets", httr::add_headers(.headers=headers), query = params)
  
  if (res$status_code==429) {
    print("I'm in jungle")
    Sys.sleep(60) 
    get_page_coin(pagenum) 
  }
  
  t<- fromJSON(content(res,"text"))
  return(t)
}


list_of_df<-lapply(1:50, get_page_coin)
all_df<-rbindlist(list_of_df)

get_page_coin(5)
res$status_code

saveRDS(all_df)
#########

#########



