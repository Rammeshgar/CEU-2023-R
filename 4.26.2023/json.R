
library(data.table)
library(jsonlite)
library(ggplot2)  

t<- '{
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}'

my_list<-fromJSON(t)

#how to read json
my_list$glossary$GlossDiv$GlossList$GlossEntry$GlossDef$GlossSeeAlso

#how to write json
toJSON(my_list,pretty = T, auto_unbox = T)

#how to link and read from another file and get info from it
t<-fromJSON('menu.json')
t$menu$popup$menuitem$value[3]

##find the remove temp
t1<- fromJSON('app.json',simplifyDataFrame = F)
t1$`web-app`$servlet[[5]]$`init-param`$removeTemplateCache

##find help first way
t2<-fromJSON('menu.json',simplifyDataFrame = F)
t2$menu$items[[21]]$id

###find help second way
t3<-fromJSON('menu.json')
t3$menu$items$id[21]


#how to check information online
nd<- fromJSON('https://api.exchangerate.host/convert?from=USD&to=HUF')
print(nd)
nd$result

nd<- fromJSON('https://api.exchangerate.host/convert?from=EUR&to=HUF')
nd$result

nd<- fromJSON('https://api.exchangerate.host/timeseries?start_date=2020-01-01&end_date=2023-03-28&base=EUR&symbols=HUF')
nd$base


#we add all datas into a data frame and divided into two colomns

t<- fromJSON('https://api.exchangerate.host/timeseries?start_date=2022-01-01&end_date=2022-03-29&base=USD&symbols=HUF')
df <- rbindlist(t$rates)
df$date  <- names(t$rates)
df$date  <- as.Date(df$date)

#visualizing the data

ggplot(df, aes(x=date, y=HUF, color=HUF))+
  geom_line(size=0.8)+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 15,hjust = 1,colour = "brown4"),
        axis.text.y = element_text(angle = 35,hjust = 1,colour = "brown4"),
        axis.title.x = element_text(colour = "purple4"),
        axis.title.y = element_text(colour = "purple4"))+
  scale_color_gradient(low = "pink2",high = "purple4")+
  labs(title = "USD to HUF from Jan till 29th March",x= "Date", y="HUF")


##EUR to HUF in last year
nt<- fromJSON('https://api.exchangerate.host/timeseries?start_date=2022-03-29&end_date=2023-03-29&base=EUR&symbols=HUF')
df <- rbindlist(nt$rates)
df$date  <- names(nt$rates)
df$date  <- as.Date(df$date)

ggplot(df, aes(x=date, y=HUF, color=HUF))+
  geom_jitter()+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 15,hjust = 1,colour = "brown4"),
        axis.text.y = element_text(angle = 15,hjust = 1,colour = "brown4"),
        axis.title.x = element_text(colour = "purple4"), 
        axis.title.y = element_text(colour = "purple4"))+
  scale_color_gradient(low = "navy",high = "red4")+
  labs(title = "EUR to HUF from 29th March 2022 till 29th March 2023",x= "Date", y="HUF")

  
##fake IRAN RIAL TO USD in last year
IRR<-fromJSON('https://api.exchangerate.host/timeseries?start_date=2022-03-29&end_date=2023-03-29&base=USD&symbols=IRR')
Idf<- rbindlist(IRR$rates, fill = T)
Idf$date<- names(IRR$rates)
Idf$date<- as.Date(Idf$date)

ggplot(Idf, aes(date, IRR, color= IRR))+
  geom_line()+
  geom_smooth(size=0.1,orientation = 2)+
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 15,hjust = 1),
        axis.text.y = element_text(angle = 15,hjust = 1),
        axis.title.x = element_text(colour = "navy"), 
        axis.title.y = element_text(colour = "navy"))+
  labs(title = "USD to fake value of IRR from March 2022 till March 2023", x= "Date", y="Fake IRR")

##Afghan to USD in last year
af<- fromJSON('https://api.exchangerate.host/timeseries?start_date=2022-03-29&end_date=2023-03-29&base=USD&symbols=AFN')
Adf<- rbindlist(af$rates)
Adf$date<- names(af$rates)
Adf$date<-as.Date(Adf$date)

ggplot(Adf, aes(date, AFN, color= AFN, fill="pink"))+
  geom_polygon()+
  theme_classic()+ 
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 35,hjust = 1),
        axis.text.y = element_text(angle = 35,hjust = 1),
        axis.title.x = element_text(colour = "navy"), 
        axis.title.y = element_text(colour = "navy"))+
  labs(title = "USD to AFN from March 2022 till March 2023", x="Date",y="AFN to USD")


