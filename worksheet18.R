# Consider the following R function
addR <- function(x, y)
{
  return(x + y)
}
library(Rcpp)
# cppFunction() is a function that takes a bunch of C++ codes (all in quotes)
# and then saves and compiles it.
# In C++, we have to declare the type of every object.
# The function we are making is addC() which accepts two integers
# and returns the sum of the two integers.
cppFunction('int addC(int x, int y) {
int sum = x + y;
return sum;
}')

addR(3,4)
addC(3,4)

library(rbenchmark)
benchmark(addR(1e7,1e7),addC(1e7,1e7),replications=1000)
##R is slower than Cpp

######################3

# In R
EucR <- function(x, y)
{
  rtn <- sqrt(sum( (x-y)^2 ))
  return(rtn)
}
# In C++ using Rcpp
cppFunction('double EucC(NumericVector x, NumericVector y) {
double track = 0;
int n = x.size();
for(int i = 0; i < n; i++){
track = track + pow( (x[i] - y[i]), 2);
}
track = sqrt(track);
return track;
}
')


x <- runif(1e4)
y <- runif(1e4)
# all.equal checks whether result is the same
all.equal(EucR(x, y),EucC(x, y))

############################


#1.
benchmark(EucR(x,y),EucC(x,y),replications = 1e4)

#2.
library(Rcpp)
library(rbenchmark)


func <- function(vec)
{
  n <- length(vec)
  # for tracking sum and log
  sum.log <- 0
  log.of.vec <- numeric(length(n))
  # calculating logs and sum for each element
  for(i in 1:n)
  {
    log.of.vec[i] <- log(vec[i])
    sum.log <- sum.log + log.of.vec[i]
  }
  # fraction
  frac <- log.of.vec/sum.log
  return(frac)
}

func2 <- function(vec)
{
  n <- length(vec)
  # for tracking sum and log
  
  # calculating logs and sum for each element
  log.of.vec<-log(vec)
  sum.log<-sum(log.of.vec)
  
  # fraction
  frac <- log.of.vec/sum.log
  return(frac)
}

cppFunction('NumericVector funcC(NumericVector x) {
int n=x.size();
NumericVector ans(n);
double sum=0;
NumericVector log_vec (n);
for(int i=0;i<n;i++){
log_vec[i]=log(x[i]);
sum=sum+log_vec[i];
}
for(int i=0;i<n;i++){
ans[i]=log_vec[i]/sum;
}
return(ans);
}
')
x<-runif(1:1e4)
x
benchmark(func(x),func2(x),funcC(x))

#3.

cppFunction('NumericMatrix sum_of_matrices(NumericMatrix x,NumericMatrix y){
int m=x.row();
int n=x.col();
for(int i=0;i<m;i++){
for(int j=0;j<n;j++){
sum=
}
}

            ')
mat1<-matrix(runif(1e4),nrow=1e2,ncol=1e2)
mat2<-matrix(runif(1e4),nrow=1e2,ncol=1e2)
sum_of_matrices(mat1,mat2)





