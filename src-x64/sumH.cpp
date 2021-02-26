#include <Rcpp.h>

using namespace Rcpp;

//' Add a number to a sum of vector
//'
//' @param x A vector
//' @param h a nuber to add
//' @export
// [[Rcpp::export]]
double sumH(NumericVector x, double h) {
  int n = x.size();
  double total = h;
  for(int i = 0; i < n; i++){
    total += x[i];
  }
  return total;
}


