#' IRT 1PL  Simulation in STAN
#'
#' Fit a 1PL model to simulated data using STAN
#'
#' @param model Model to be used. Must be available in working directory
#' @param data Dataset to be used
#' @param wd Desired working directory (string)
#' @param cores Number of cores to use
#' @param iter Number of iterations
#' @param chains Number of chains
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @keywords IRT 1PL STAN
#' @export
#'

STAN_IRT_1PL <- function(model = "IRT-1PL.stan", data, wd, cores, iter, chains ){
  setwd(wd)

  # model <- system.file("Models", "IRT-1PL.stan", package="dcms") # See: https://stat.ethz.ch/pipermail/r-help/2010-August/247748.html
  model <- "IRT-1PL.stan"
  data <- data

  I <- data$I # persons
  J <- data$J # items
  N <- data$N
  ii <- data$ii
  jj <- data$jj
  y <- data$y

  # Inits
  thetaInit <- stats::rnorm(I, 0, 1)
  betaInit <- stats::rnorm(J, 0, 1)

  # function form 2 with an argument named `chain_id`
  # This is copied from ?stan
  initf2 <- function(chain_id = 1) {
    list(theta = thetaInit, beta = betaInit)
  }

  # generate a list of lists to specify initial values
  # Copied from ?stan
  init_ll <- lapply(1:chains, function(id) initf2(chain_id = id))

  rstan::stan(file= model,
                      data = list(I = I, J = J, N = N, ii=ii, jj = jj, y=y),
                      cores = cores,
                      iter = iter,
                      chains = chains,
                      init = init_ll,
                      verbose=TRUE,
                      control = list(max_treedepth = 15)
              )
}
