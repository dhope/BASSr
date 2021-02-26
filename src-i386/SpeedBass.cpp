#include <Rcpp.h>
using namespace Rcpp;


// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//


//' sum of vector
//'
//' @param x A vector
//' @export
// [[Rcpp::export]]
double sumC(NumericVector x) {
  int n = x.size();
  double total = 0;
  for(int i = 0; i < n; ++i) {
    total += x[i];
  }
  return total;
}

//' Opposite signs True or false
//'
//' @param x a double value
//' @param y an integer
//' @export
// [[Rcpp::export]]
bool oppositeSigns(double x, int y)
{
  return (std::pow(x, y) < 0);
}



//' The internal BASSr benefit algorithm
//'
//' @param hex A vector of land cover values
//' @param w A vector of weights for each land cover value
//' @param sample a vector of land cover values from random sample
//' @param total a vector of land cover values from total of study area
//' @param printDets logical - should you print the details - messy for now.
//' @export
// [[Rcpp::export]]
double speedbass(NumericVector hex,NumericVector w, NumericVector sample, NumericVector total, bool printDets=false) {
  int nc = hex.size();
  if(nc != sample.size() || nc != total.size() || sample.size() != total.size() || nc != w.size()){
    Rcout << "Error!: Hexagon, sample, and total are not the same size\n";
  }
  double tt = sumC(total); // Larger region (study area) area
  double tot = sumC(sample); // Sample total area
  double totHex = sumC(hex); // Hexagon area
  // NumericVector ben(nc);
  // int goodben = 0;
  double ben = 0;
  for(int i = 0; i < nc; ++i) {
    // Rcout << i;
    if(total[i] != 0.){
    double z = (hex[i] + sample[i]) / (tot + totHex); // prop habitat of sample plus hex
    double tp =  total[i] / tt; // prop habitat for larger region
    double sp = sample[i] / tot; // prop habitat for sample alone.
    double d = (z - sp); // difference in prop habitat between sample and sample plus hex

    int dd;
    if(sp > tp) {dd = -1;
      } else if(sp < tp) {
        dd = 1;
        } else if(sp == tp) {
          dd = 0;
          } else{
            dd = -99;
            Rcout << "Strange ben\n" ;
            }
    // double dir_ = 0;
    // if (d != 0.) { dir_ = d / abs(d);
    if(printDets){
    Rcout << z << "\t" ;
    Rcout << sp << "\t" ;
    Rcout << tp  << "\t" ;
    Rcout << d << "\t" ;
    Rcout << dd << "\t" ;

    }
    // if((oppositeSigns(d, dd) == false) && (dd!=0)){

    if( ( (d < 0 ) && (dd < 0) ) || ( (d > 0) && (dd > 0) ) || ( (d == 0) && (dd == 0) ) ){
      ben  += std::abs(d) * w[i];
      // goodben++;
      // Rcout << "Success\n";
      if(printDets){Rcout << "Included" << "\n" ;}
      }   else {
        if(printDets){Rcout << "Not" << "\n" ;}
      }
    }
  }
  // Rcout << goodben << "-----------------\n" ;
  return ben;
}



//' Run speed bass on all hexagons and all samples
//'
//' @param hexes Matrix of hexagon land covers. Rows are hexagons, columns are land cover types
//' @param samples Matrix of hexagon land covers from random sample. Rows are hexagons, columns are land cover types
//' @param total Vector of total land cover. values are individual land cover types
//' @param w A vector of weights for each land cover value
//' @param printDets print details of function calculation. For debugging.
//' @export
// [[Rcpp::export]]
NumericVector allhexes(NumericMatrix hexes, NumericMatrix samples, NumericVector total, NumericVector w, bool printDets=false) {
  int nhex = hexes.nrow();
  int nsamples = samples.nrow();
  NumericVector meanHexBen(nhex);
  // NumericVector sample = samples(1, _);
  for (int i =0; i < nhex; ++i){
    NumericVector hex = hexes(i, _);
    double samplebenefit = 0;
    for(int j = 0; j < nsamples; ++j){
      NumericVector sample = samples(j, _);
      samplebenefit += speedbass(hex,w, sample, total, printDets = printDets);
      // Rcout << samplebenefit << "\n" ;
    }
    // Rcout << nhex << "\t"<< nsamples << "\n" ;
    // Rcout << "---------------------" << "\n" ;
    meanHexBen[i] = (samplebenefit / nsamples);

  }
  return meanHexBen;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R

# speedbass(hexes[554,1:21] %>% t %>% as.vector,
#           samples$data[[1]][1,1:21] %>% t %>% as.vector,
#           total[1,1:21] %>% t %>% as.vector,
#           )
#
# allhexes(as.matrix(hexes), samples =samples$data %>% bind_rows() %>% as.matrix, total[1,1:21] %>% t %>% as.vector )



*/
