library('devtools')
install_github("drackham/CDADataSims", ref="develop") # develop
library('CDADataSims')
library('coda')
library('ggmcmc')
library('parallel')
library('rstan')

data <- simpleData()
q <- simpleQ()

I <- data$I
J <- data$J
K <- data$K
x <- data$xMat

# fit <- stan(file='simpleRUM.stan',
#                     data=list(I=I,J=J,K=K,x=x,q=q),
#                     init=0, seed = 23,
#                     iter=2,
#                     chains=1)
