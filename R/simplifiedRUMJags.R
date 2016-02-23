#' Simplified RUM Simulation in JAGS
#'
#' Fit a simplified RUM model to simulated data and evaluate data-model fit using JAGS.
#'
#' @param data Uses the CDADataSims simplifiedRUM function to generate data
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords hartz roussos RUM JAGS
#' @export

runJagsSim <- function(data,
                       q = NULL,
                       adaptSteps = 10,
                       burnInSteps = 40,
                       numSavedSteps = 10,
                       thinSteps = 1) {

  I <- data$I
  J <- data$J
  K <- data$K
  x <- data$xMat

  dataList = list(
    I = I ,
    K = K ,
    J = J ,
    q = q ,
    x = x)

  jagsModel <- system.file("Models", "simplifiedRUM.jags", package="CDASimStudies") # See: https://stat.ethz.ch/pipermail/r-help/2010-August/247748.html
  # jags.params = c('alpha', 'rStar')
  jags.params = c('rStar')

  nChains = min(1, max(1, parallel::detectCores()-1)) # Multi-core support 1 less than num cores, up to 1

  inits <- vector("list", nChains)

  inits <- lapply(inits, function(x) list(.RNG.name="lecuyer::RngStream", .RNG.seed=sample(1:1e+06,1,replace=F)))

  # ------------------------------------------- MCMC Estimation ------------------------------------------------------------------------
  # Start the timer
  mcmcEstimationTimer <- proc.time()

  # Run the chains
  runJagsOut <- runjags::run.jags( method="rjparallel",
                          model=jagsModel,
                          modules=c('glm on', 'lecuyer on'), # http://andrewgelman.com/2011/07/23/parallel-jags-rngs/ AND https://cran.r-project.org/web/packages/runjags/vignettes/quickjags.html
                          monitor=jags.params,
                          data=dataList,
                          n.chains=nChains,
                          adapt=adaptSteps,
                          burnin=burnInSteps,
                          sample=ceiling(numSavedSteps/nChains),
                          thin=thinSteps,
                          keep.jags.file=FALSE, # see results.jags
                          summarise=FALSE,
                          plots=FALSE,
                          inits=inits # http://andrewgelman.com/2011/07/23/parallel-jags-rngs/
  )
  # End timer
  mcmcDuration <- (proc.time() - mcmcEstimationTimer)
  mcmcDuration

  return(runJagsOut)

}

