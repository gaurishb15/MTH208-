library(rvest)
library(tidyverse)
html<-read_html("https://www.imdb.com/chart/top/")
html
movie<-html_elements(html,".watchlistColumn div")
movie
codes<-html_attr(movie,"data-tconst")
codes
mlink<-paste("https://www.imdb.com/title/",codes,"/ratings/",sep="")
mlink


for(i in 1:length(mlink)){
  html<-read_html(mlink[i])
  all_ratings <- html %>% html_table()
  ratings<-as.data.frame(all_ratings[[1]])
  ratings[,c(1,3)]
  
  
}



html <- read_html("https://www.imdb.com/title/tt0111161/ratings")
all_ratings <- html %>% html_table()
all_ratings
length(all_ratings)
all_ratings[[1]] # First item in list
ratings<-as.data.frame(all_ratings[[1]])
ratings[,c(1,3)]



all_ratings[[2]] # Second item in list
all_ratings[[3]] # Third item in list
