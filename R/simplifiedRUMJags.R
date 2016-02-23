#' Simplified RUM Simulation in JAGS
#'
#' Fit a simplified RUM model to simulated data and evaluate data-model fit using JAGS.
#'
#' @params data Uses the CDADataSims simplifiedRUM function to generate data
#'
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords hartz roussos RUM JAGS
#'
#' @examples
#' simplifiedRUMSimSTAN()
#' @export

# simplifiedRUMSimSTAN <- function(){ }

## Temp loads for convenience
library('runjags')
library('parallel')
library('CDADataSims', lib.loc = '/usr/local/lib/R/3.2/site-library')

data <- simplifiedRUMData()
q <- hartzRoussosQLow()

J <- data$J
I <- data$I
K <- data$K
N <- data$N

x <- data$xMat

dataList = list(
  #N = N ,
  I = I ,
  K = K ,
  J = J ,
  q = q ,
  x = x)

jagsModel <- "R/simplifiedRUM.jags"
jags.params = c('alpha', 'rStar')

nChains = min(1, max(1, detectCores()-1)) # Multi-core support 1 less than num cores, up to 1

inits <- vector("list", nChains)

inits <- lapply(inits, function(x) list(.RNG.name="lecuyer::RngStream", .RNG.seed=sample(1:1e+06,1,replace=F)))

adaptSteps <- 15
burnInSteps <- 50
numSavedSteps <- 200
thinSteps <- 1

# ------------------------------------------- MCMC Estimation ------------------------------------------------------------------------
# Start the timer
mcmcEstimationTimer <- proc.time()

# Run the chains
runJagsOut <- run.jags( method="rjparallel",
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
                        #inits=inits # http://andrewgelman.com/2011/07/23/parallel-jags-rngs/
)
# End timer
mcmcDuration <- (proc.time() - mcmcEstimationTimer)
mcmcDuration

