#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector dummy(NumericVector x){
  return x;
}

//2.
// [[Rcpp::export]]
NumericVector exceed_1(int n){
  NumericVector times_called(n);
  for(int i=0;i<n;i++){
    double ans=0;
    int count=0;
    while(ans<=1){
      ans=ans+R::runif(0,1);
      count++;
    }
    times_called(i)=count;
  }
  
  return times_called;
}

// [[Rcpp::export]]
double average_of_vector(NumericVector x){
  double avg,sum=0;
  int len=x.length();
  for(int i=0;i<len;i++){
    sum=sum+x(i);
  }
  avg=sum/len;
  return avg;
}


