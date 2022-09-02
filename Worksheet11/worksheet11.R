library(rvest)
library(tidyverse)

#1.
dataframe<-load("IMDB_movies.Rdata")
print(dataframe) #To get name of Data Frame

movies<-dat$name
ratings<-dat$rating
men_rating<-dat$men_rating
women_rating<-dat$women_rating
votes<-dat$over.votes

##2.
#a.
hist(ratings,main="Histogram of Ratings",xlab="Ratings")

#b.
hist(ratings,main="Histogram of Ratings",xlab="Ratings",col="white")

#3.
boxplot(ratings,main="Boxplot of Ratings")


#4.
boxplot(ratings,main="Boxplot of Ratings",col="Pink")


#5.
hist(men_rating,main="Histogram of Ratings",xlab="Ratings",col="yellow",xlim=range(c(men_rating,women_rating)))
#Need to use xlim because Range of both women And Men Rating is not same
hist(women_rating,main="Histogram of Ratings",xlab="Ratings",add=TRUE,col=adjustcolor("blue",alpha.f = .45))
legend("topright",fill=c("yellow","blue"),legend = c("men","women"))
#Alone Men Ratings -> Yellow
#Alone Women Ratings -> Blue
#Both Ratings -> Mixture of Yellow And Blue

#6.
plot(x=votes,y=ratings)

#7.
text(which(ratings>8.9),movies)

