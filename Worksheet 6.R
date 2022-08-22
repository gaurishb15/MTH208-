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
movienames<-html_text(movies)
movienames

#3.
