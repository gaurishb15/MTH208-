1.
#Hasn't Mentioned the population of men and women
#Hasn't Mentioned the proportion of men and women drivers
#How likely male or female drivers are on larger trip

2.
Do those dentists worked independtly or worked with colgate
Were those dentists well qualified

6.
Average temp. of the whole world over a year

library(MASS)
data(accdeaths)
set<-force(accdeaths)
set
column<-matrix(set,nrow=6,ncol=12)
column
data_set<-as.data.frame(column)
data_set
names(data_set)<-c("January","February","March","April","May","June","July","August","September","October","November","December")

data_set
names(data_set)
data_set[1,]
plot(names(data_set),data_set[1,])
plot.ts(accdeaths)
