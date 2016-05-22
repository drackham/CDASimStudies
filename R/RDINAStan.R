library('devtools')
install_github("drackham/CDADataSims", ref="develop")
library('CDADataSims')
library('parallel')
library('rstan')

stanSim <- function(data, q, wd, cores, iter, chains ){
  rstan_options(auto_write = TRUE)
  options(mc.cores = parallel::detectCores())

  data <- data
  q <- q

  I <- data$I
  J <- data$J
  y <- data$resp
  dSim <- data$d
  fSim <- data$f

  setwd(wd)

  fit <- stan(file='RDINA.stan',
                      data = list(I=I,J=J,y=y),
                      cores = cores,
                      iter = iter,
                      chains = chains,
                      control = list(max_treedepth = 15)
              )

  save(fit, file="stanFit.R")
}
