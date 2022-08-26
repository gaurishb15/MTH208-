library(tidyverse)
library(rvest)
html<-read_html("https://www.imdb.com/chart/top/")
html
code<-html_elements(html,".watchlistColumn div")
code
codes<-html_attr(code,"data-tconst")
codes
links<-c(1:250)
for(i in 1:250){
  links[i]<-paste("https://www.imdb.com/title/",codes[i],"/",sep="")
}
links
ratelinks<-paste(links,"ratings/",sep="")
ratelinks


MovieNames<-c(1:2)
ReleaseYear<-c(1:2)
total_votes<-c(1:2)
final_ratings<-c(1:2)
votes_by_men<-c(1:2)
ratings_men<-c(1:2)
votes_by_women<-c(1:2)
ratings_women<-c(1:2)
ratings_10<-c(1:2)
ratings_9<-c(1:2)
ratings_8<-c(1:2)
ratings_7<-c(1:2)
ratings_6<-c(1:2)
ratings_5<-c(1:2)
ratings_4<-c(1:2)
ratings_3<-c(1:2)
ratings_2<-c(1:2)
ratings_1<-c(1:2)

for(j in 1:2){
  #i.
  html<-read_html(ratelinks[j])
  html
  movies<-html_elements(html,".parent h3 a")
  MovieNames[j]<-html_text(movies)
  MovieNames[j]
  
  
  #ii. Year OF Movie 
  year<-html_elements(html,".parent h3 span")
  years<-html_text(year)
  years
  year<-gsub(" ","",years)
  years<-gsub("\n","",year)
  ReleaseYear[j]<-substring(years,2,5)
  ReleaseYear[j]
  
  #iii.
  all_ratings <- html %>% html_table()
  length(all_ratings)
  all<-all_ratings[[2]]$'All Ages'[1]
  all
  len<-nchar(all)
  total_votes[j]<-substring(all,55,len)
  total_votes[j]
  
  #iv.
  final_ratings[j]<-substring(all,1,3)
  final_ratings[j]
  
  #v.
  all_ratings[[1]]$Rating
  all_ratings[[1]]$Votes[1]
  ratings_10[j]<-all_ratings[[1]]$Votes[1]
  ratings_9[j]<-all_ratings[[1]]$Votes[2]
  ratings_8[j]<-all_ratings[[1]]$Votes[3]
  ratings_7[j]<-all_ratings[[1]]$Votes[4]
  ratings_6[j]<-all_ratings[[1]]$Votes[5]
  ratings_5[j]<-all_ratings[[1]]$Votes[6]
  ratings_4[j]<-all_ratings[[1]]$Votes[7]
  ratings_3[j]<-all_ratings[[1]]$Votes[8]
  ratings_2[j]<-all_ratings[[1]]$Votes[9]
  ratings_1[j]<-all_ratings[[1]]$Votes[10]
  
  #vi.
  all<-all_ratings[[2]]$'All Ages'[2]
  all
  len<-nchar(all)
  votes_by_men[j]<-substring(all,55,len)
  votes_by_men[j]
  ratings_men[j]<-substring(all,1,3)
  ratings_men[j]
  
  #vii.
  all<-all_ratings[[2]]$'All Ages'[3]
  all
  len<-nchar(all)
  votes_by_women[j]<-substring(all,55,len)
  votes_by_women[j]
  ratings_women[j]<-substring(all,1,3)
  ratings_women[j]
}

df<-data.frame(MovieNames,ReleaseYear,total_votes,final_ratings,ratings_1,ratings_2,ratings_3,ratings_4,ratings_5,ratings_6,ratings_7,ratings_8,ratings_9,ratings_10,votes_by_men,votes_by_women,ratings_men,ratings_women)
df



#2.
links
links[1]

piclink<-c(1:2)
for(i in 1:2){
  imglink<-read_html(links[1])
  imglink
  imglink<-html_elements(imglink,".ipc-button.ipc-button--single-padding.ipc-button--center-align-content.ipc-button--default-height.ipc-button--core-baseAlt.ipc-button--theme-baseAlt.ipc-button--on-textPrimary.ipc-text-button.sc-f6306ea-2.dfHGIi")
  imglink
  pic<-html_elements(imglink,".poster")
  pic
  piclinks<-html_attr(pic,"src")
  piclinks
  piclink[i]<-paste("https://www.imdb.com/",piclinks,sep="")
}
piclink[1]

#3.
library(imager)
poster <- load.image(piclink[1])
poster
plot(poster)


for( i in 1:2){
  poster <- load.image(piclink[i])
  plot(poster)
}











