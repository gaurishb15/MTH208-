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
i=1
while(ratings[i]>8.9){
  text(x=votes[i],y=ratings[i],movies[i])
  i=i+1
}

#8.
year<-dat$year
year

for(i in 1:250){
  if(year[i]<1996){
    plot(x=votes,y=ratings,col="green")
  }
  else{
    plot(x=votes,y=ratings,col="blue")
  }
}

year
year_less<-year<1996
year_less<-year[year_less]
year_less
year_more<-year[year>=1996]
year_more
year_diff<-data.frame(year_less,year_more)
year_diff
plot(votes,ratings,pch=16,col=year<1960,col="green")


