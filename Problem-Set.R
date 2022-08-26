library(rvest)
library(tidyverse)

#1.
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

#2.
html<-read_html("https://en.wikipedia.org/wiki/United_States_at_the_Olympics")


#3.

i=1
  link<-paste("https://stats.stackexchange.com/questions?tab=votes&amp;page=",i,sep="")
link
html<-read_html(link)
title<-html_text(html_elements(html,".s-post-summary--content h3 .s-link"))
title

view<-html_elements(html,".s-post-summary--stats-item.is-supernova")
view
views<-html_attr(view,"title")
views<-substring(views,1,nchar(views)-6)
views

nanswers<-html_text(html_elements(html,".s-post-summary--stats.js-post-summary-stats div .s-post-summary--stats-item-number"))
nanswers

nvotes<-html_text(html_elements(html,".s-post-summary--stats-item.s-post-summary--stats-item__emphasized .s-post-summary--stats-item-number"))
nvotes

df<-data.frame(title,views,nanswers,nvotes)
df















