#' Generate the RDINA Jags model
#'
#' Dynamically generates explicit priors for the simple RUM model for JAGS.
#'
#' @param I Number of items
#' @param J Number of examinees
#' @param K Number of skills
#' @param q Q-matrix
#' @author Dave Rackham \email{ddrackham@gmail.com}
#' @references \url{http://onlinelibrary.wiley.com/doi/10.1002/j.2333-8504.2008.tb02157.x/abstract}
#' @keywords RUM JAGS
#' @export
generateRDINAJags <- function(){
  modelString <- paste(
"model
  {
    for (j in 1:J) { # respondents
      for (i in 1:I) {# items
        y[j,i] ~ dbern(p[j,i])
      }
    }

    for (j in 1:J) {
      alpha1[j] ~ dbern(sc1)
      alpha2[j] ~ dbern(sc2)

      p[j,1] <- ilogit(f[1] + d[1] * (alpha1[j]))
      p[j,2] <- ilogit(f[2] + d[2] * (alpha1[j]))
      p[j,3] <- ilogit(f[3] + d[3] * (alpha1[j]))
      p[j,4] <- ilogit(f[4] + d[4] * (alpha1[j]))
      p[j,5] <- ilogit(f[5] + d[5] * (alpha1[j]))
      p[j,6] <- ilogit(f[6] + d[6] * (alpha1[j]))
      p[j,7] <- ilogit(f[7] + d[7] * (alpha1[j]))
      p[j,8] <- ilogit(f[8] + d[8] * (alpha1[j]))
      p[j,9] <- ilogit(f[9] + d[9] * (alpha1[j]))
      p[j,10] <- ilogit(f[10] + d[10] * (alpha1[j]))

      p[j,11] <- ilogit(f[11] + d[11] * (alpha2[j]))
      p[j,12] <- ilogit(f[12] + d[12] * (alpha2[j]))
      p[j,13] <- ilogit(f[13] + d[13] * (alpha2[j]))
      p[j,14] <- ilogit(f[14] + d[14] * (alpha2[j]))
      p[j,15] <- ilogit(f[15] + d[15] * (alpha2[j]))
      p[j,16] <- ilogit(f[16] + d[16] * (alpha2[j]))
      p[j,17] <- ilogit(f[17] + d[17] * (alpha2[j]))
      p[j,18] <- ilogit(f[18] + d[18] * (alpha2[j]))
      p[j,19] <- ilogit(f[19] + d[19] * (alpha2[j]))
      p[j,20] <- ilogit(f[20] + d[20] * (alpha2[j]))

      p[j,21] <- ilogit(f[21] + d[21] * (alpha1[j] * alpha2[j]))
      p[j,22] <- ilogit(f[22] + d[22] * (alpha1[j] * alpha2[j]))
      p[j,23] <- ilogit(f[23] + d[23] * (alpha1[j] * alpha2[j]))
      p[j,24] <- ilogit(f[24] + d[24] * (alpha1[j] * alpha2[j]))
      p[j,25] <- ilogit(f[25] + d[25] * (alpha1[j] * alpha2[j]))
      p[j,26] <- ilogit(f[26] + d[26] * (alpha1[j] * alpha2[j]))
      p[j,27] <- ilogit(f[27] + d[27] * (alpha1[j] * alpha2[j]))
      p[j,28] <- ilogit(f[28] + d[28] * (alpha1[j] * alpha2[j]))
      p[j,29] <- ilogit(f[29] + d[29] * (alpha1[j] * alpha2[j]))
      p[j,30] <- ilogit(f[30] + d[30] * (alpha1[j] * alpha2[j]))

    }

    #priors for RDINA parameters d and f
    for (i in 1:I) {
      f[i] ~ dgamma(8,2)
      d[i] ~ dbeta(1,1)
    }

    #priors for skill class sizes
    sc1 ~ dbeta(1,1)
    sc2 ~ dbeta(1,1)
  }"
  )

  # Write the string
  writeLines (modelString, con="RDINA.jags")
}
