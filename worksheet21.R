#Season - biased
#esi koi wavelength jispe sari barley ki kinds ki avg. value ho

demo<-read.csv('LowRepeated.csv',nrows=5,header=FALSE)
proper_data<-read.csv('LowRepeated.csv',skip=4)


plot(proper_data$wave,proper_data$Karl)
plot(proper_data$wave,proper_data$Lacey)
plot(proper_data$wave,proper_data$KLBC4.130j.KK)




plot(proper_data[,1],proper_data[,2],type="l",xlab="Wavelength",lwd=2,ylab="Reflectance")
#lines(proper_data[,1],proper_data[,3],col=proper_data[,3])
nrow(proper_data)
for(i in 1:ncol(proper_data)){
  lines(proper_data[,1],proper_data[,i], col = rainbow(nrow(proper_data[,i]),start = 0,end=1)[i])
}

dates<-as.factor(demo[1,-1])
dates
levels(dates)

