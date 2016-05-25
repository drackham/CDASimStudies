# HO_RDINA model in OpenBUGS (L. DeCarlo, 12/11)
#' Generate the HO-R-DINA JAGS model
#'
#' Generates the HO-R-DINA JAGS model for a simple data set
#'
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords RDINA JAGS
#' @export
#'
generateHO_R_DINA_Jags <- function(){
  modelString <- paste(
    "model
{
for (i in 1:N) {
	for (j in 1:J) {
		y[i,j] ~ dbern(pa[i,j])
	}
}

# Item parameters?
for (i in 1:N){

	# Examinee-level parameters
	# Probability(alpha)?

	# Don't use ilogit function! (boundary issues?)
	# pa[i,1] <- ilogit(f[1] + d[1] * (alpha1[i] * alpha2[i]))
	pa[i,1] <- 1 / (1 + exp(-f[1] - d[1] * (alpha1[i] * alpha2[i]) ) )
	# ...
	# pa[i,15] <- ilogit(f[15] + d[15] * (alpha1[i] * alpha2[i]))
	pa[i,15] <- 1 / (1 + exp(-f[15] - d[15] * (alpha1[i] * alpha2[i]) ) )


	# Has respondent mastered skill?
	alpha1[i] ~ dbern(p1[i])
	alpha2[i] ~ dbern(p2[i])

}

# priors for RDINA parameters f and d (item parameters)
for (j in 1:J) {
	d[j] ~ dnorm(0, 0.1) I(0,)
	f[j] ~ dnorm(0, 0.1)
}

#priors for HO parameters b and a and uncertain elements
a1 ~ dnorm(0,1)
# ..
a15 ~ dnorm(0,1)

b1 ~ dnorm(0,1)
# ..
b15 ~ dnorm(0,1)


for (i in 1:N) {
	# higher-order factor
	theta[i] ~ dnorm(0,1)

	# SKill-level parameters
	# b[skill] item difficulty
	# a[skill] item discrimination
	# theta[respondent] continous higher-order factor (association among skills)
	# alpha[skill] constrained to be equal is the restricted higher-order model

	p1[i] <- exp(b1 + a1 * theta[i]) / (1 + exp(b1 + a1 * theta[i]))
	# ..
	p15[i] <- exp(b15 + a15 * theta[i]) / (1 + exp(b15 + a15 * theta[i]))

}

}")

  # Write the string
  writeLines (modelString, con="HO-R-DINA.jags")
}
