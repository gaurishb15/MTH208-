library(imager) #now without quotes
dog <- load.image("dog.jpeg")

plot(dog)
col.mat <- as.array(dog[, ,1, ]) #3-D Array
col.mat
dimen<-dim(col.mat)

dist<-matrix(0,nrow=dimen[1],ncol=dimen[2])

#1.
for(i in 1:nrow(dist)){
  for(j in 1:ncol(dist)){
    dist[i,j]=norm((col.mat[i,j,]-c(0,1,0)),"2")
  }
}
dist
greenpoint<-which(dist==min(dist),arr.ind = TRUE)
greenpoint
points(greenpoint,col="green")

#2.
for(i in 1:nrow(dist)){
  for(j in 1:ncol(dist)){
    dist[i,j]=norm((col.mat[i,j,]-c(1,0,0)),"2")
  }
}
dist
redpoint<-which(dist==min(dist),arr.ind = TRUE)
redpoint
points(redpoint,col="red")

#For Blue Point
for(i in 1:nrow(dist)){
  for(j in 1:ncol(dist)){
    dist[i,j]=norm((col.mat[i,j,]-c(0,0,1)),"2")
  }
}
dist
bluepoint<-which(dist==min(dist),arr.ind = TRUE)
bluepoint
points(bluepoint,col="blue")

#3.

img <- load.image("col1.png")
plot(img)

col.mat <- as.array(img[, ,1, ]) #3-D Array
col.mat
dimen<-dim(col.mat)
dist<-matrix(0,nrow=dimen[1],ncol=dimen[2])

pixels<-0
for(i in 1:nrow(dist)){
  for(j in 1:ncol(dist)){
    
    if(norm((col.mat[i,j,]-c(1,0,0)),"2")==0){
      print("Yes")
      pixels<-pixels+1
    }
  }
}
pixels
if(pixels==dimen[1]*dimen[2])
  print("Red")

r<-0
g<-0
b<-0
for(i in 1:nrow(dist)){
  for(j in 1:ncol(dist)){
    r<-r+col.mat[i,j,1]
    g<-g+col.mat[i,j,2]
    b<-b+col.mat[i,j,3]
  }

}
r
g
b
if(r>g & r>b){
  print("Red")
}
else if(g>r & g>b){
  print("Red")
}
else if(b>g & b>r){
  print("Red")
}