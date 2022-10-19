#1.
dat<-read.csv("auto-mpg.csv")
head(dat)

cor(dat$acceleration,dat$mpg)

#2.
x<-dat$acceleration
y<-dat$mpg
plot(x,y,xlab="Acceleration",ylab="Miles per gallon")

# assuming dataset loaded is called dat
abline(lm(dat$mpg ~ dat$acceleration))

#3.
plot(x,y,xlab="Acceleration",ylab="Miles per gallon",col=dat$cylinders,pch=19)
legend(dat$cylinders)

#a.
for(i in unique(dat$cylinders)){
  abline(lm(dat$mpg[dat$cylinders==i] ~ dat$acceleration[dat$cylinders==i]),col=dat$cylinders[dat$cylinders==i])
}

#5.
iris$Sepal.Length
iris$Sepal.Width
plot(x,y,xlab="Length Of Sepal",ylab="Width Of Sepal",col=iris$Species,pch=19)
abline(lm(iris$Sepal.Length ~ iris$Sepal.Width))

for(i in unique(iris$Species)){
  abline(lm(iris$Sepal.Length[iris$Species==i] ~ iris$Sepal.Width[iris$Species==i]),col=iris$Species[iris$Species==i])
}
