library(ggplot2)
load("IMDB_movies.Rdata")


ggplot(dat, aes(x = rating))

#g<- ggplot(dat,aes(x=rating))

# First, we define the data are studying
# then the variables
# then the type of plot

#Below are one variable plots
ggplot(dat, aes(x = rating)) + geom_histogram() 
ggplot(dat, aes(x = rating)) + geom_histogram() + coord_flip() #To flip Data
# g + geom_histogram()

ggplot(dat, aes(x = rating)) + geom_boxplot()

ggplot(dat, aes(x = rating)) + geom_bar()

#Two variable plots
ggplot(dat, aes(x = year, y = over.votes)) + geom_point()

ggplot(dat, aes(x = year, y = over.votes)) + geom_point() + coord_cartesian(xlim = c(1996, 2025))


#Aesthetics
Year <- dat$year < 2000
Year
Year <- as.factor(Year)
Year
levels(Year) <- c("Before 2000", "After 2000")
Year
ggplot(dat, aes(x = over.votes, y = rating)) +
  geom_point(aes(shape = Year, col = Year)) +
  labs(title = "Votes vs Rating", y = "Rating", x = "Number of Votes")



load("covid.Rdata")
ggplot(india_rates, aes(x = ConfirmedCases)) + geom_histogram(bins = 20)
ggplot(india_rates, aes(x = ConfirmedCases)) + geom_histogram(bins = 15)

ggplot(india_rates, aes(x = ActiveCases)) + geom_histogram(bins=10)

ggplot(india_rates, aes(x = Death)) + geom_histogram()


ggplot(dat, aes(x = ConfirmedCases, y = over.votes)) + geom_point()






