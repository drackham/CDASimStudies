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
for (i in 1:I) {
	for (j in 1:J) {
		y[i,j] ~ dbern(pa[i,j])
	}
}

# Item parameters?
for (i in 1:I){

	# Examinee-level parameters
	# Probability(alpha)?

	# Don't use ilogit function! (boundary issues?)
	pa[i,1] <- 1 / (1 + exp(-fHat[1] - dHat[1] * (alpha1[i])))
	pa[i,2] <- 1 / (1 + exp(-fHat[2] - dHat[2] * (alpha1[i])))
	pa[i,3] <- 1 / (1 + exp(-fHat[3] - dHat[3] * (alpha1[i])))
	pa[i,4] <- 1 / (1 + exp(-fHat[4] - dHat[4] * (alpha1[i])))
	pa[i,5] <- 1 / (1 + exp(-fHat[5] - dHat[5] * (alpha1[i])))
	pa[i,6] <- 1 / (1 + exp(-fHat[6] - dHat[6] * (alpha1[i])))
	pa[i,7] <- 1 / (1 + exp(-fHat[7] - dHat[7] * (alpha1[i])))
	pa[i,8] <- 1 / (1 + exp(-fHat[8] - dHat[8] * (alpha1[i])))
	pa[i,9] <- 1 / (1 + exp(-fHat[9] - dHat[9] * (alpha1[i])))
	pa[i,10] <- 1 / (1 + exp(-fHat[10] - dHat[10] * (alpha1[i])))

	pa[i,11] <- 1 / (1 + exp(-fHat[11] - dHat[11] * (alpha2[i])))
	pa[i,12] <- 1 / (1 + exp(-fHat[12] - dHat[12] * (alpha2[i])))
	pa[i,13] <- 1 / (1 + exp(-fHat[13] - dHat[13] * (alpha2[i])))
	pa[i,14] <- 1 / (1 + exp(-fHat[14] - dHat[14] * (alpha2[i])))
	pa[i,15] <- 1 / (1 + exp(-fHat[15] - dHat[15] * (alpha2[i])))
	pa[i,16] <- 1 / (1 + exp(-fHat[16] - dHat[16] * (alpha2[i])))
	pa[i,17] <- 1 / (1 + exp(-fHat[17] - dHat[17] * (alpha2[i])))
	pa[i,18] <- 1 / (1 + exp(-fHat[18] - dHat[18] * (alpha2[i])))
	pa[i,19] <- 1 / (1 + exp(-fHat[19] - dHat[19] * (alpha2[i])))
	pa[i,20] <- 1 / (1 + exp(-fHat[20] - dHat[20] * (alpha2[i])))
	
	pa[i,21] <- 1 / (1 + exp(-fHat[21] - dHat[21] * (alpha1[i] * alpha2[i])))
	pa[i,22] <- 1 / (1 + exp(-fHat[22] - dHat[22] * (alpha1[i] * alpha2[i])))
	pa[i,23] <- 1 / (1 + exp(-fHat[23] - dHat[23] * (alpha1[i] * alpha2[i])))
	pa[i,24] <- 1 / (1 + exp(-fHat[24] - dHat[24] * (alpha1[i] * alpha2[i])))
	pa[i,25] <- 1 / (1 + exp(-fHat[25] - dHat[25] * (alpha1[i] * alpha2[i])))
	pa[i,26] <- 1 / (1 + exp(-fHat[26] - dHat[26] * (alpha1[i] * alpha2[i])))
	pa[i,27] <- 1 / (1 + exp(-fHat[27] - dHat[27] * (alpha1[i] * alpha2[i])))
	pa[i,28] <- 1 / (1 + exp(-fHat[28] - dHat[28] * (alpha1[i] * alpha2[i])))
	pa[i,29] <- 1 / (1 + exp(-fHat[29] - dHat[29] * (alpha1[i] * alpha2[i])))
	pa[i,30] <- 1 / (1 + exp(-fHat[30] - dHat[30] * (alpha1[i] * alpha2[i])))


	# Has respondent mastered skill?
	alpha1[i] ~ dbern(p1[i])
	alpha2[i] ~ dbern(p2[i])

}

	# priors for RDINA parameters f and d (item parameters)
	for (j in 1:J) {
		dHat[j] ~ dnorm(0, 0.1) I(0,)
		fHat[j] ~ dnorm(0, 0.1)
	}

	#priors for HO parameters b and a and uncertain elements
	a ~ dnorm(0,1)
	
	b1 ~ dnorm(0,1)
	b2 ~ dnorm(0,1)

	for (i in 1:I) {
		# higher-order factor
		theta[i] ~ dnorm(0,1)
	
		# SKill-level parameters
		# b[skill] item? difficulty
		# a[skill] item? discrimination
		# theta[respondent] continous higher-order factor (association among skills)
		# alpha[skill] constrained to be equal is the restricted higher-order model
	
		p1[i] <- exp(b1 + a * theta[i]) / (1 + exp(b1 + a * theta[i]))
		p2[i] <- exp(b2 + a * theta[i]) / (1 + exp(b2 + a * theta[i]))
	
	}

}")

  # Write the string
  writeLines (modelString, con="HO-R-DINA.jags")
}
