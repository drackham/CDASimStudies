#' R-DINA Simulation in STAN
#'
#' Fit a R-DINA model to simulated data using STAN
#'
#' @param model Model to use
#' @param data Dataset to be used
#' @param wd Desired working directory (string)
#' @param cores Number of cores to use
#' @param iter Number of iterations
#' @param chains Number of chains
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @keywords R-DINA STAN
#' @export
#'

continuousStan <- function(model = "R-DINA-Non-Logit.stan", data, wd, cores, iter, chains ){
  setwd(wd)

  # model <- system.file("Models", model, package="dcms") # See: https://stat.ethz.ch/pipermail/r-help/2010-August/247748.html
  data <- data

  I <- data$I
  J <- data$J
  y <- data$resp
  b0Sim <- data$b0
  b1Sim <- data$b1
  b2Sim <- data$b2

  # Inits
  b0Init <- stats::rnorm(J, 0, 10)
  b1Init <- stats::rnorm(J, 0, 10)
  b2Init <- stats::rnorm(J, 0, 10)
  alpha1Init <- stats::rbeta(I, 2, 2)
  alpha2Init <- stats::rbeta(I, 2, 2)
  a1Init <- stats::rgamma(1, 2, 2)
  a2Init <- stats::rgamma(1, 2, 2)
  bh1Init <- stats::rgamma(1, 2, 2)
  bh2Init <- stats::rgamma(1, 2, 2)

  # function form 2 with an argument named `chain_id`
  # This is copied from ?stan

  initf2 <- function(chain_id = 1) {
    list(b0 = b0Init, b1 = b1Init, b2 = b2Init, alpha1 = alpha1Init,
         alpha2 = alpha2Init, a1 = a1Init, a2 = a2Init, bh1 = bh1Init, bh2 = bh2Init)
  }

  # generate a list of lists to specify initial values
  # Copied from ?stan
  init_ll <- lapply(1:chains, function(id) initf2(chain_id = id))

  rstan::stan(file = model,
              data = list(I=I,J=J,y=y),
              cores = cores,
              iter = iter,
              chains = chains,
              init = init_ll,
              verbose = TRUE,
              control = list(max_treedepth = 15)
  )
}
