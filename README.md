## Master
[![Travis-CI Build Status](https://travis-ci.org/drackham/CDASimStudies.svg?branch=master)](https://travis-ci.org/drackham/CDASimStudies)

## Develop
[![Travis-CI Build Status](https://travis-ci.org/drackham/CDASimStudies.svg?branch=develop)](https://travis-ci.org/drackham/CDASimStudies)


## Synopsis

This package leverages the heavy lifting done by CDADataSims to then fit various CDA models to the simulated data. The intention is to create wrappers around each model type so that the final script which executes the model can be much cleaner/simpler. 

Currently there is support for the following models (in various states of effectiveness!):
* RUM model using explicit priors in JAGS
* Reduced-RUM model in JAGS
* Reparamaterized-DINA model in JAGS
* Reparamaterized-DINA model in STAN

## Code Example

sim <- rDINAJagsSim(data, q, jagsModel="RDINA.jags",
                   adaptSteps = 1000, burnInSteps = 1000, numSavedSteps = 10000, thinSteps = 1)

## Motivation

Simulation work is hard enough without having to worry about keeping track of which version I simulated etc.

## Installation

Use `devtools` to install from the github repo.

## Tests

Test run as part of a CI environment using testthat.

## Contributors

Dave Rackham ddrackham@gmail.com

## License

TBD
