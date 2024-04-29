

library(rvest)
library(data.table)
library(xml2)
library(plyr)

require(httr)

params = list(
  `tableonly` = "true",
  `limit` = "25",
  `offset` = "25"
)

res <- httr::GET(url = "https://api.nasdaq.com/api/screener/stocks", query = params)

# convert the reponse to the list 
convert_to_list <-fromJSON(content(res, 'text'))

# target the rows in the  list file
df <- convert_to_list$data$table$rows
