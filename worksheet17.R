#1.
num1 <- numeric(length = 1e3) # 8000
object.size(num1)

num2 <- numeric(length = 1e6) # 8*1e6
object.size(num2)

mat1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000) #1e5
object.size(mat1)

mat2 <- matrix( nrow = 100, ncol = 1000) #1e5
object.size(mat2)
mat2

arr <- array(0, dim = c(100,100,100)) #1e6
object.size(arr)

#2.
library(rbenchmark)
benchmark({
for(i in 1:1e4){
  rnorm(n=1,mean=0,sd=1)
}},{
rnorm(n=1e4,mean=0,sd=1)
},replications = 1e2)

#The one with loops is much slower

#3.
benchmark({rnorm(n=1e4)},{runif(n=1e4)},replications = 1e3)
#runif is faster

#4.
rho_mat_1 <- function(n, rho)
{
  mat <- matrix(rho, nrow = n, ncol = n)
  for(i in 1:n){
    for(j in 1:n){
      mat[i,j]=rho^(abs(i-j))
    }
  }
  return(mat)
}
rho_mat_2 <- function(n, rho)
{
  mat <- matrix(rho, nrow = n, ncol = n)
  mat <- rhoˆ(abs(col(mat) - row(mat)))
  return(mat)
}

benchmark(
  {
    rho_mat_1 <- function(n, rho)
{
  mat <- matrix(nrow = n, ncol = n)
  for(i in 1:n){
    for(j in 1:n){
      mat[i,j]=rho ^ (abs(i-j))
    }
  }
  return(mat)
}
 rho_mat_1(1e2,2)
},{
  rho_mat_2 <- function(n, rho)
  {
    mat <- matrix(rho, nrow = n, ncol = n)
    mat <- mat ^ (abs(col(mat) - row(mat)))
    return(mat)
  }
  rho_mat_2(1e2,2)
},replications = 1e2)

#Without Loops is faster

#5.
x<-c(10,1e2,1e3,1e4,1e5,1e6)
y<-numeric(length=6)
for(i in 1:6){
  n<-10^i
  print(n)
  sumi<-0
  for(j in 1:n){
    sumi=sumi+log10(j)
  }
  print(sumi)
  y[i]<-sumi-n*log10(n)+n*log10(exp(1))-0.5*log10(2*pi*n)
  
}
y<-10^y
y
plot(x,y,xlab="value of n",ylab="value of function")







#6.
x<-numeric(length=1e3)
for(i in 1:1e3){
  x[i]<-i
}
print(x)

benchmark({
norm(x,"2")},{
sqrt(sum(x^2))},replications = 1000)

#sqrt is much more faster.

#7.
benchmark({
func1 <- function(n = 1e10)
{
  nums <- 1:(n ^ 2)
  nums
  mat <- matrix(nums, nrow = n, ncol = n)
  mat
  means <- apply(mat, 2, mean)
  norm.means <- sqrt(sum(means ^ 2))
  return(norm.means)
}
},{
func2 <- function(n = 1e10)
{
  nums <- 1:(n ^ 2)
  mat <- matrix(nums, nrow = n, ncol = n)
  means <- colMeans(mat)
  norm.means <- sqrt(sum(means ^ 2))
  return(norm.means)
}},replications = 1e4)










