#Season - biased
#esi koi wavelength jispe sari barley ki kinds ki avg. value ho

demo<-read.csv('LowRepeated.csv',nrows=4,header=FALSE)
proper_data<-read.csv('LowRepeated.csv',skip=4)


plot(proper_data$wave,proper_data$Karl)
plot(proper_data$wave,proper_data$Lacey)
plot(proper_data$wave,proper_data$KLBC4.130j.KK)




plot(proper_data[,1],proper_data[,2],type="l",xlab="Wavelength",lwd=2,ylab="Karl")
lines(proper_data[,1],proper_data[,3],col=proper_data[,3])
for(i in 2:ncol(proper_data)){
  lines(proper_data[,1],proper_data[,i],col=proper_data[,i])
}

