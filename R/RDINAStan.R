#' R-DINA Simulation in STAN
#'
#' Fit a R-DINA model to simulated data using STAN
#'
#' @param data Dataset to be used
#' @param q Q-matrix to be sued
#' @param wd Desired working directory (string)
#' @param cores Number of cores to use
#' @param iter Number of iterations
#' @param chains Number of chains
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @keywords R-DINA STAN
#' @export
#'

stanSim <- function(data, q, wd, cores, iter, chains ){
  rstan::rstan_options(auto_write = TRUE)
  options(mc.cores = parallel::detectCores())

  data <- data
  q <- q

  I <- data$I
  J <- data$J
  y <- data$resp
  dSim <- data$d
  fSim <- data$f

  setwd(wd)

  rstan::stan(file='RDINA.stan',
                      data = list(I=I,J=J,y=y),
                      cores = cores,
                      iter = iter,
                      chains = chains,
                      control = list(max_treedepth = 15)
              )
}
