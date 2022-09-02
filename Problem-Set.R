library(rvest)
library(tidyverse)

#8th.
html<-read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")

movierank<-html_elements(html,".countdown-index")
Ranking<-html_text(movierank)
Ranking<-substring(Ranking,2,nchar(Ranking))
Ranking

movienames<-html_elements(html,".article_movie_title div h2 a")
MovieNames<-html_text(movienames)
MovieNames

tomatoes<-html_elements(html,".article_movie_title div h2 .tMeterScore")
Tomato<-html_text(tomatoes)
Tomato

year<-html_elements(html,".article_movie_title div h2 .subtle.start-year")
years<-html_text(year)
Year<-substring(years,2,5)
Year

df<-data.frame(Ranking,MovieNames,Tomato,Year)
df

#9th.
html<-read_html("https://en.wikipedia.org/wiki/United_States_at_the_Olympics")



#3.
title<-c(1:30)
views<-c(1:30)
nanaswers<-c(1:30)
nvotes<-c(1:30)

for(i in 1:2){
  link<-paste("https://stats.stackexchange.com/questions?tab=votes&page=",i,sep="")
#link
html<-read_html(link)
html

#####
for(j in 1:15){
title[j+(i-1)*15]<-html_text(html_elements(html[j],".s-post-summary--content h3 .s-link"))
}

html<-read_html(link)
html<-html_elements(html,".s-post-summary--stats.js-post-summary-stats")
#html
#views[11]<-html_attr(html_elements(html[11],".s-post-summary--stats-item.is-supernova"),"title")
#views[11]

for(j in 1:15){
  #print(i)
  small<-html_elements(html[j],"div")
  if(html_attr(small[3],"class")=="s-post-summary--stats-item is-supernova"){
    views[j+(i-1)*15]<-html_attr(html_elements(html[j],".s-post-summary--stats-item.is-supernova"),"title")
  }
  else if(html_attr(small[3],"class")=="s-post-summary--stats-item is-hot")
    views[j+(i-1)*15]<-html_attr(html_elements(html[j],".s-post-summary--stats-item.is-hot"),"title")
  #print(views[i])
views[j+(i-1)*15]<-substring(views[j+(i-1)*15],1,nchar(views[j+(i-1)*15])-6)
}

html<-read_html(link)
html<-html_elements(html,".s-post-summary.js-post-summary .s-post-summary--stats.js-post-summary-stats .s-post-summary--stats-item.has-answers ")
tags<-html_attr(html,"class")
for(j in 1:15){
if(tags[j]=="s-post-summary--stats-item has-answers has-accepted-answer")
  nanswers[j+(i-1)*15]<-html_text(html_elements(html[j],".s-post-summary--stats-item-number"))
  else
    nanswers[j+(i-1)*15]<-html_text(html_elements(html[j],".s-post-summary--stats-item-number"))
}
#nanswers


######
html<-read_html(link)
for(j in 1:15){
nvotes[j+(i-1)*15]<-html_text(html_elements(html[j],".s-post-summary--stats-item.s-post-summary--stats-item__emphasized .s-post-summary--stats-item-number"))
}

}
title
df<-data.frame(title,views,nanswers,nvotes)
df
save(df,file="dataframe.Rdata")














