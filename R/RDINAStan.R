library('devtools')
install_github("drackham/CDADataSims", ref="uniqueDF")
library('CDADataSims')
library('coda')
library('ggmcmc')
library('parallel')
library('rstan')
library("shinystan")

data <- rDINA()
q <- simpleQ()

I <- data$I
J <- data$J
K <- data$K
y <- data$resp
dSim <- data$d
fSim <- data$f

setwd("~/dev/CDASimStudies/R")

fit <- stan(file='RDINA.stan',
                    data=list(I=I,J=J,y=y),
                    init=0,
                    seed = 23,
                    warmup = 4000,
                    cores = 3,
                    iter=5000,
                    chains=3)

print(fit)

launch_shinystan(fit)
