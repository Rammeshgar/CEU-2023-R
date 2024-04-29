library(rvest)
library(xml2)
library(data.table)

# first step
url <- read_html("https://www.yachtworld.co.uk/yacht/2003-luhrs-40-convertible-8631025/")

details<-list()
details[["Price"]]<-url %>% html_nodes(".payment-total") %>% html_text()
details[["Name & size"]]<-url %>% html_nodes(".heading") %>% html_text()

keys<-url %>% html_nodes(".datatable-title") %>% html_text()
values<-url %>% html_nodes(".datatable-value") %>% html_text()

if (length(keys)==length(values)) {
  for (i in 1:length(keys)) {
    details[[keys[i]]]<-values[i]
  }
}

details


get_yaghtworld <- function(turl) {
  
  url <- read_html(turl)
  details<-list()
  details[["Price"]]<-url %>% html_nodes(".payment-total") %>% html_text()
  details[["Name & size"]]<-url %>% html_nodes(".heading") %>% html_text()
  
  keys<-url %>% html_nodes(".datatable-title") %>% html_text()
  values<-url %>% html_nodes(".datatable-value") %>% html_text()
  
  if (length(keys)==length(values)) {
    for (i in 1:length(keys)) {
      details[[keys[i]]]<-values[i]
    }
  }
  return(details)
}

get_yaghtworld("https://www.yachtworld.co.uk/yacht/2022-beneteau-oceanis-40.1-8452736/")

links<-c("https://www.yachtworld.co.uk/yacht/2003-riviera-58-convertible-7044334/",
         "https://www.yachtworld.co.uk/yacht/2005-riviera-40-mediterranean-8686573/",
         "https://www.yachtworld.co.uk/yacht/2008-sea-ray-355-sundancer-8741199/")

my_list<-lapply(links, get_yaghtworld)
df<-rbindlist(my_list,fill = T)

page_links<-url %>% html_nodes(".make-model") %>% html_attr("href")






# get?links ------=---------------------------------------------------------
t<-read_html("https://www.yachtworld.co.uk/boats-for-sale/?page=2")
my_links<-t %>% html_node(".listings-container") %>% html_nodes("a") %>% html_attr("href")

#first way
getlinks <- function(pagenum) {
  t<-read_html(paste0("https://www.yachtworld.co.uk/boats-for-sale/?page=",pagenum))
  my_links<-t %>% html_node(".listings-container") %>% html_nodes("a") %>% html_attr("href")
  return(my_links)
}

alllink <- lapply(1:11, getlinks)
unlist(alllink)

#second way
all_links<-c()

for (i in 2:5) {
  t<-read_html(paste0("https://www.yachtworld.co.uk/boats-for-sale/?page=",i))
  my_links<-t %>% html_node(".listings-container") %>% html_nodes("a") %>% html_attr("href")
  all_links<-c(all_links,my_links)
}

#checking
my_list<-lapply(all_links, get_yaghtworld)
df<-rbindlist(my_list,fill = T)

