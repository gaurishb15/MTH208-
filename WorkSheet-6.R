install.packages("tidyverse")
install.packages("rvest")

library(tidyverse)
library(rvest)
html <- read_html("https://www.iitk.ac.in/math/faculty")
html #The complete html code for the website is saved in the object html.

# extracting all tags with class = head3. The
# "." indicates class.
name <- html_elements(html, ".head3")
name

# From all the head3 class, extracting all link tags
name <- html_elements(name, "a")
name

# Extracting the text associated with the links
name <- html_text(name)
name

## A faster way
name <- html_elements(html, ".head3 a")
name <- html_text(name)
name

name <- html %>% html_elements(".head3 a") %>% html_text()
name

#1.
html<-read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
html
names<-html_elements(html,".head2")
names
names<-html_text(names)
names

#2.
html <- read_html("https://www.imdb.com/chart/top/")
movies<-html_elements(html,".titleColumn a")
MovieNames<-html_text(movies)
MovieNames

#3.
#ii. Year OF Movie 
year<-html_elements(html,"tr td .secondaryInfo")
years<-html_text(year)
years
ReleaseYear<-substring(years,2,5)
ReleaseYear

#iii. Rating of Movie
rating<-html_elements(html,"tr td strong")
Ratings<-html_text(rating)
Ratings
nchar(Ratings[1])

#iv. No. Of Votes
vote<-html_elements(html,"tr td strong")
vote
fullline<-html_attr(vote,"title")
fullline
Votes <- numeric(length = 250)
for(i in 1:length(fullline)){
  Votes[i]<-substring(fullline[i],nchar(Ratings[i])+11,nchar(fullline[i])-10-nchar(Ratings[i]))
  Votes[i]<-gsub(',','',Votes[i])
}
Votes

df<-data.frame(MovieNames,ReleaseYear,Ratings,Votes)
df
