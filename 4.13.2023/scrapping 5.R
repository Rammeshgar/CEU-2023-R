

library(rvest)

url <- "https://www.ultimatespecs.com/car-specs"
t <- read_html(url) # read the general page, where you have all the cars

inner_page <- t %>% html_nodes('#car_make .col-md-3 a') %>% html_attr('href') # select all the link for each car 

# use gsub() method to delete '-model' from the end of car link
clean_inner_link <- gsub('-models','',inner_page)

all_link <- paste0('https://www.ultimatespecs.com',clean_inner_link)

# -----------------
inner_page <- all_link[233]
read_inner_link <- function(inner_page) {
  print(inner_page)
  # next2 steps: add the result of the inner link to the end of outer link and check each car webpage with past() method 
  t_link <- read_html(inner_page)
  #t <- read_html('https://www.ultimatespecs.com/car-specs/a-d-Tramontana')
  car_link <- t_link %>% html_nodes('.someOtherRow a') %>% html_attr('href')
  
  # we should filter cars, those end with .html 
  car_link <- car_link[endsWith(car_link,'.html')]
  
  
  # concet eah link to the base url 
  result <- paste0('https://www.ultimatespecs.com', car_link)
  return(result)
}

read_all_links <- lapply(all_link[1:50], read_inner_link)

# unlist all the vector we recived from function 

all_cars_links <- unlist(read_all_links)

saveRDS(all_cars_links,"carslinks.rds")###how to save data's in our folder
