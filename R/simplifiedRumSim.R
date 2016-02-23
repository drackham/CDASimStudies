#' Simplified RUM Simulation in STAN
#'
#' Fit a simplified RUM model to simulated data and evaluate data-model fit using STAN.
#'
#' @params data Uses the CDADataSims simplifiedRUM function to generate data
#'
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords hartz roussos RUM STAN
#'
#' @examples
#' sim1 <- simplifiedRUMSimSTAN()
#' @export

## Temp loads for convenience
library('rstan')
library('CDADataSims', lib.loc = '/usr/local/lib/R/3.2/site-library')

simplifiedRUMSimSTAN <- function(data, q) {

  data <- simplifiedRUMData()
  q <- hartzRoussosQLow()

  J <- data$J
  I <- data$I
  N <- data$N
  x <- data$x
  jj <- data$jj
  ii <- data$ii

  fit <- 0
  nChains <- 1;
  nIter <- 10;
  tStart <- proc.time()[3];

  # print(paste("J=",J,", K=",K," N=",J*K,sep=""),quote=F);

  # fit <- stan(file='R/irt_multilevel.stan',
  #             data=list(J=J,K=I,N=N,jj=jj,kk=ii,y=x),
  #             fit=fit,
  #             # init=0,
  #             iter=nIter,
  #             chains=nChains,
  #             seed=23)

  tEnd <- proc.time()[3]
  tElapsed <- tEnd - tStart

}





