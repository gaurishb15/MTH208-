
//4.
// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace arma;
// [[Rcpp::export]]
double timesTwo(arma::vec x,arma::vec y) {
  // inner product of two vectors is a matrix
  int m=x.size();
  int n=y.size();
  mat inn(m,n);
  inn = x.t() * y;
  // returning the first element of a 1x1 matrix
  return inn(0);
}
