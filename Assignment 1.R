
tennis<-function(p){
  win<-0
  loss<-0
  z<-0
  while(1){
    y<-sample(x=1:2,size=1,prob =c( p,1-p))
    if(y==1)
      win<-win+1
    else
      loss<-loss+1
    z<-z+1
    if(z==5)
      break
    if(win==3)
      break
    if(loss==3)
      break
  }
  return (z)
}

#2.
matches<-c(1:1000)
for(i in 1:1000){
  matches[i]<-tennis(0.7)
}
ans<-mean(matches)
