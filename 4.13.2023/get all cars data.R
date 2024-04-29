
library(rvest)
library(data.table)
all_links <- readRDS("C://Users/admin/OneDrive/Documents/Rcodes/web scraping/carslinks.rds")

car_link<-all_links[13]



get_car_detail <- function(url) {
 tryCatch({
   print(url)
   cardata<-read_html(url)
   
   data_list<-list()
   
   key<-cardata %>% html_nodes(".tabletd") %>% html_text() %>% trimws()
   
   value<- cardata %>% html_nodes(".tabletd_right") %>% html_text() %>% trimws()
   
   data_list[["car tiltle"]]<-cardata %>% html_nodes(".page_ficha_title_text span") %>% html_text()
   
   if (length(key)==length(value)) {
     for (i in 1:length(key)) {
       data_list[[key[i]]]<-value[i]
     }
   }
   return(data_list)
 },error = function(e){
   print(e)
   print("There was an error message.")
 })
}

get_car_detail(all_links[172])

link_list<-lapply(all_links[1:20], get_car_detail)
links_list<-rbindlist(link_list,fill=T)



# check = tryCatch({
#   expression
# }, warning = function(w){
#   code that handles the warnings
# }, error = function(e){
#   code that handles the errors
# }, finally = function(f){
#   clean-up code
# })
# R program illustrating error handling
# Applying tryCatch
tryCatch(			
  
  # Specifying expression
  expr = {					
    1 +"1"
    print("Everything was fine.")
  },
  # Specifying error message
  error = function(e){
    print(e)
    print("There was an error message.")
  },
  
  finally = {			
    print("finally Executed")
  }
)


a<-list(3,"a",1,2)

for (i in a) {
  tryCatch(			
    
    # Specifying expression
    expr = {					
      print(i+2)
    },
    # Specifying error message
    error = function(e){
      print(e)
      print("There was an error message.")
    }
  )
}

