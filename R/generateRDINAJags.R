#' Generate the RDINA Jags model
#'
#' Generates the RDINA Jags model for a simple data set
#'
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords RDINA JAGS
#' @export
#'
generateRDINAJags <- function(){
  modelString <- paste(
"model
  {
    for (i in 1:I) { # examinee
      for (j in 1:J) { # items
        y[i,j] ~ dbern(p[i,j])
      }
    }

    for (i in 1:I) {
      alpha1[i] ~ dbeta(a1[i],b1[i])
      alpha2[i] ~ dbeta(a2[i],b2[i])
		
			# hyperpriors for alpha1 and alpha2

			a1[i] ~ dunif(0.001, 50)
			b1[i] ~ dnorm(0.001, 50)
			
			a2[i] ~ dnorm(0, 0.01)I(0,)
			b2[i] ~ dnorm(0, 0.01)I(0,)

			p[i,1] <- 1 / (1 + exp(-fHat[1] - dHat[1] * (alpha1[i])))
			p[i,2] <- 1 / (1 + exp(-fHat[2] - dHat[2] * (alpha1[i])))
			p[i,3] <- 1 / (1 + exp(-fHat[3] - dHat[3] * (alpha1[i])))
			p[i,4] <- 1 / (1 + exp(-fHat[4] - dHat[4] * (alpha1[i])))
			p[i,5] <- 1 / (1 + exp(-fHat[5] - dHat[5] * (alpha1[i])))
			p[i,6] <- 1 / (1 + exp(-fHat[6] - dHat[6] * (alpha1[i])))
			p[i,7] <- 1 / (1 + exp(-fHat[7] - dHat[7] * (alpha1[i])))
			p[i,8] <- 1 / (1 + exp(-fHat[8] - dHat[8] * (alpha1[i])))
			p[i,9] <- 1 / (1 + exp(-fHat[9] - dHat[9] * (alpha1[i])))
			p[i,10] <- 1 / (1 + exp(-fHat[10] - dHat[10] * (alpha1[i])))

      p[i,11] <- 1 / (1 + exp(-fHat[11] - dHat[11] * (alpha2[i])))
      p[i,12] <- 1 / (1 + exp(-fHat[12] - dHat[12] * (alpha2[i])))
      p[i,13] <- 1 / (1 + exp(-fHat[13] - dHat[13] * (alpha2[i])))
      p[i,14] <- 1 / (1 + exp(-fHat[14] - dHat[14] * (alpha2[i])))
      p[i,15] <- 1 / (1 + exp(-fHat[15] - dHat[15] * (alpha2[i])))
      p[i,16] <- 1 / (1 + exp(-fHat[16] - dHat[16] * (alpha2[i])))
      p[i,17] <- 1 / (1 + exp(-fHat[17] - dHat[17] * (alpha2[i])))
      p[i,18] <- 1 / (1 + exp(-fHat[18] - dHat[18] * (alpha2[i])))
      p[i,19] <- 1 / (1 + exp(-fHat[19] - dHat[19] * (alpha2[i])))
      p[i,20] <- 1 / (1 + exp(-fHat[20] - dHat[20] * (alpha2[i])))

			p[i,21] <- 1 / (1 + exp(-fHat[21] - dHat[21] * (alpha1[i] * alpha2[i]))) 
			p[i,22] <- 1 / (1 + exp(-fHat[22] - dHat[22] * (alpha1[i] * alpha2[i]))) 
			p[i,23] <- 1 / (1 + exp(-fHat[23] - dHat[23] * (alpha1[i] * alpha2[i]))) 
			p[i,24] <- 1 / (1 + exp(-fHat[24] - dHat[24] * (alpha1[i] * alpha2[i]))) 
			p[i,25] <- 1 / (1 + exp(-fHat[25] - dHat[25] * (alpha1[i] * alpha2[i]))) 
			p[i,26] <- 1 / (1 + exp(-fHat[26] - dHat[26] * (alpha1[i] * alpha2[i]))) 
			p[i,27] <- 1 / (1 + exp(-fHat[27] - dHat[27] * (alpha1[i] * alpha2[i]))) 
			p[i,28] <- 1 / (1 + exp(-fHat[28] - dHat[28] * (alpha1[i] * alpha2[i]))) 
			p[i,29] <- 1 / (1 + exp(-fHat[29] - dHat[29] * (alpha1[i] * alpha2[i]))) 
			p[i,30] <- 1 / (1 + exp(-fHat[30] - dHat[30] * (alpha1[i] * alpha2[i]))) 

    }

    # priors for RDINA parameters d and f
    for (j in 1:J) {
      dHat[j] ~ dnorm(7,.5)
      fHat[j] ~ dnorm(-3,.5)
    }

  }"
  )

  # Write the string
  writeLines (modelString, con="RDINA.jags")
}
