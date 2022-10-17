library(Rcpp)
sourceCpp("src.cpp")

#1.



#2.
#a.
exceed_1(1)

#b.
vec<-numeric(length=1e3)
vec<-exceed_1(1e3)
vec

#c.
average_of_vector(vec)

#3.








#4.
vec1<-numeric(length=3)
vec2<-numeric(length=3)
vec1<-runif(3)
vec2<-runif(3)
sourceCpp("source.cpp")

timesTwo(vec1,vec2)

timesTwo_R<-function(vec1,vec2){
  return(vec1+vec2)
}
library(rbenchmark)
benchmark({timesTwo_R(vec1,vec2)},timesTwo(vec1,vec2),replications=1000)












