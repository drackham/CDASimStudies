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
  setwd(wd)

  model <- system.file("Models", "R-DINA.stan", package="CDASimStudies") # See: https://stat.ethz.ch/pipermail/r-help/2010-August/247748.html
  data <- data
  q <- q

  I <- data$I
  J <- data$J
  y <- data$resp
  dSim <- data$d
  fSim <- data$f

  # Inits
  fHatInit <- c(rep(0, J))
  dHatInit <- c(rep(0, J))
  alpha1Init <- c(rep(0.001, I))
  alpha2Init <- c(rep(0.001, I))
  a1Init <- c(rep(0.001, I))
  a2Init <- c(rep(0.001, I))
  b1Init <- c(rep(0.001, I))
  b2Init <- c(rep(0.001, I))

  # function form 2 with an argument named `chain_id`
  # This is copied from ?stan
  initf2 <- function(chain_id = 1) {
    list(fHat = fHatInit, dHat = dHatInit, alpha1 = alpha1Init,
         alpha2 = alpha2Init, a1 = a1Init, a2 = a2Init,
         b1 = b1Init, b2 = b2Init)
  }

  # generate a list of lists to specify initial values
  # Copied from ?stan
  init_ll <- lapply(1:chains, function(id) initf2(chain_id = id))

  rstan::stan(file= model,
                      data = list(I=I,J=J,y=y),
                      cores = cores,
                      iter = iter,
                      chains = chains,
                      init = init_ll,
                      verbose=TRUE,
                      control = list(max_treedepth = 15)
              )
}
