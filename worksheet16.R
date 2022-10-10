library(profvis)
profvis({
  attempts <- function(age)
  {
    count <- 0
    remain <- age # age no. of candles remain in the beginning
    while(remain > 0)
    {
      count <- count + 1
      # randomly choose any number between 1 and remain
      blow_out <- sample(1:remain, size = 1)
      remain <- remain - blow_out
    }
    return(count)
  }
  att_vec <- numeric(length = 1e4)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(25)
  }
})

#1.
profvis({
  attempts <- function(age)
  {
    count <- 0
    remain <- age # age no. of candles remain in the beginning
    while(remain > 0)
    {
      count <- count + 1
      # randomly choose any number between 1 and remain
      blow_out <- sample(1:remain, size = 1)
      remain <- remain - blow_out
    }
    return(count)
  }
  att_vec <- numeric(length = 1e4)
  replicate(1e4,attempts(25))  #In Place of for loop
})

#2.
library(rbenchmark)
benchmark({
  att_vec <- numeric(length = 1e4)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(25)
  }},
  replicate(1e4, attempts(25)), replications = 100)

#3.
benchmark({
  att_vec <- numeric(length = 1e3)
  for(i in 1:1e3)
  {
    att_vec[i] <- attempts(25)
  }},
  replicate(1e3, attempts(25)), replications = 20)

#Lesser the no. of replications in which we find time, lesser the precise data


#4.
profvis({
attempts <- function(age)
{
  count <- 0
  remain <- age # age no. of candles remain in the beginning
  while(remain > 0)
  {
    count <- count + 1
    # randomly choose any number between 1 and remain
    blow_out <- sample(1:remain, size = 1)
    remain <- remain - blow_out
  }
  return(count)
}

#Instead of (for) loop 
att_vec <- NULL
for(i in 1:1e4)
{
  att_vec <- c(att_vec, attempts(25))
}
})


benchmark({att_vec <- numeric(length = 1e3)
for(i in 1:1e3)
{
  att_vec[i] <- attempts(25)
}},
replicate(1e3, attempts(25)),{att_vec <- NULL
for(i in 1:1e3)
{
  att_vec <- c(att_vec, attempts(25))
}}, replications = 100)

#The New Code is more slower.


#5.
library(imager)

profvis({
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])

dims <- dim(col.mat)
rot <- array(0, dim = dims)

for(i in 1:dims[1])
{
  for(j in 1:dims[2])
  {
    rot[i, j, ] <- col.mat[dims[1] - i + 1, dims[2] - j + 1, ]
  }
}
})




#6.
#Method-starting

matrix_form<-function(n,m){
  mat<-matrix(nrow=n,ncol=m)
  for(i in 1:n){
    for(j in 1:m){
      mat[i,j]<-runif(1,min=0,max=1)
    }
  }
  return(mat)
}
mat<-matrix_form(1e2,1e2)
mat
avg<-numeric(length=1e4) #length=ncol
for(i in 1:1e4){
  avg[i]<-mean(mat[,i])
}

#Method-1
colMeans(mat)

#Method-2
apply(mat, 2, mean)

ben<-benchmark({colMeans(mat)},{apply(mat, 2, mean)},replications = 1000)
#Yes! Answer Depends on the n,m value

ben
ben$elapsed





