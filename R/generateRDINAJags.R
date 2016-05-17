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
      alpha1[i] ~ beta(a1[i],b1[i])
      alpha2[i] ~ beta(a2[i],b2[i])

      a1 ~ gamma(2,2)
      b1 ~ gamma(2,2)

      a2 ~ gamma(2,2)
      b2 ~ gamma(2,2)

      p[i,1] <- ilogit(fHat[1] + dHat[1] * (alpha1[i]))
      p[i,2] <- ilogit(fHat[2] + dHat[2] * (alpha1[i]))
      p[i,3] <- ilogit(fHat[3] + dHat[3] * (alpha1[i]))
      p[i,4] <- ilogit(fHat[4] + dHat[4] * (alpha1[i]))
      p[i,5] <- ilogit(fHat[5] + dHat[5] * (alpha1[i]))
      p[i,6] <- ilogit(fHat[6] + dHat[6] * (alpha1[i]))
      p[i,7] <- ilogit(fHat[7] + dHat[7] * (alpha1[i]))
      p[i,8] <- ilogit(fHat[8] + dHat[8] * (alpha1[i]))
      p[i,9] <- ilogit(fHat[9] + dHat[9] * (alpha1[i]))
      p[i,10] <- ilogit(fHat[10] + dHat[10] * (alpha1[i]))

      p[i,11] <- ilogit(fHat[11] + dHat[11] * (alpha2[i]))
      p[i,12] <- ilogit(fHat[12] + dHat[12] * (alpha2[i]))
      p[i,13] <- ilogit(fHat[13] + dHat[13] * (alpha2[i]))
      p[i,14] <- ilogit(fHat[14] + dHat[14] * (alpha2[i]))
      p[i,15] <- ilogit(fHat[15] + dHat[15] * (alpha2[i]))
      p[i,16] <- ilogit(fHat[16] + dHat[16] * (alpha2[i]))
      p[i,17] <- ilogit(fHat[17] + dHat[17] * (alpha2[i]))
      p[i,18] <- ilogit(fHat[18] + dHat[18] * (alpha2[i]))
      p[i,19] <- ilogit(fHat[19] + dHat[19] * (alpha2[i]))
      p[i,20] <- ilogit(fHat[20] + dHat[20] * (alpha2[i]))

      p[i,21] <- ilogit(fHat[21] + dHat[21] * (alpha1[i] * alpha2[i]))
      p[i,22] <- ilogit(fHat[22] + dHat[22] * (alpha1[i] * alpha2[i]))
      p[i,23] <- ilogit(fHat[23] + dHat[23] * (alpha1[i] * alpha2[i]))
      p[i,24] <- ilogit(fHat[24] + dHat[24] * (alpha1[i] * alpha2[i]))
      p[i,25] <- ilogit(fHat[25] + dHat[25] * (alpha1[i] * alpha2[i]))
      p[i,26] <- ilogit(fHat[26] + dHat[26] * (alpha1[i] * alpha2[i]))
      p[i,27] <- ilogit(fHat[27] + dHat[27] * (alpha1[i] * alpha2[i]))
      p[i,28] <- ilogit(fHat[28] + dHat[28] * (alpha1[i] * alpha2[i]))
      p[i,29] <- ilogit(fHat[29] + dHat[29] * (alpha1[i] * alpha2[i]))
      p[i,30] <- ilogit(fHat[30] + dHat[30] * (alpha1[i] * alpha2[i]))

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
