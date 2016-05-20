library('devtools')
install_github("drackham/CDADataSims", ref="uniqueDF")
library('CDADataSims')
library('coda')
library('ggmcmc')
library('parallel')
library('rstan')
# library("shinystan")
# source("/Users/Dave/dev/EffectiveThetaBIN/Helpers/rootMeanSquaredDifference.R")

rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

data <- rDINA(100)

I <- data$I
J <- data$J
y <- data$resp
dSim <- data$d
fSim <- data$f

# setwd("~/dev/CDASimStudies/R")
setwd("/home/drackham/RDINA-STAN")

ptm <- proc.time()

fit <- stan(file='RDINA.stan',
                    data = list(I=I,J=J,y=y),
                    cores = 5,
                    iter = 1500,
                    chains = 5,
                    control = list(max_treedepth = 15)
            )

duration <- proc.time() - ptm
duration

print(fit)

post <- extract(fit, permuted = TRUE) # return a list of arrays

save(post, file="stanOut.R")

# my_sso <- launch_shinystan(fit)

# dHat <- colMeans(post$dHat)
# simD <- data$d
#
# plot(simD, dHat, xlim=c(0,18), ylim=c(0,18))
# abline(a=0,b=1)
#
# rmsd <- rootMeanSquaredDifference(simD,dHat)
# mean(rmsd)
# plot(density(rmsd)) #.820549
#
# fHat <- colMeans(post$fHat)
# simF <- data$f
#
# plot(simF, fHat, xlim=c(-10,0), ylim=c(-10,0))
# abline(a=0,b=1)
#
# rmsd <- rootMeanSquaredDifference(simF,fHat)
# mean(rmsd)
# plot(density(rmsd)) #.369
#
# launch_shinystan(my_sso)
