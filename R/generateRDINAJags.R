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
        y[i,k] ~ dbern(p[i,j])
      }
    }

    for (i in 1:I) {
      alpha1[i] ~ dbern(sc1)
      alpha2[i] ~ dbern(sc2)

      p[i,1] <- ilogit(f[1] + d[1] * (alpha1[i]))
      p[i,2] <- ilogit(f[2] + d[2] * (alpha1[i]))
      p[i,3] <- ilogit(f[3] + d[3] * (alpha1[i]))
      p[i,4] <- ilogit(f[4] + d[4] * (alpha1[i]))
      p[i,5] <- ilogit(f[5] + d[5] * (alpha1[i]))
      p[i,6] <- ilogit(f[6] + d[6] * (alpha1[i]))
      p[i,7] <- ilogit(f[7] + d[7] * (alpha1[i]))
      p[i,8] <- ilogit(f[8] + d[8] * (alpha1[i]))
      p[i,9] <- ilogit(f[9] + d[9] * (alpha1[i]))
      p[i,10] <- ilogit(f[10] + d[10] * (alpha1[i]))

      p[i,11] <- ilogit(f[11] + d[11] * (alpha2[i]))
      p[i,12] <- ilogit(f[12] + d[12] * (alpha2[i]))
      p[j,13] <- ilogit(f[13] + d[13] * (alpha2[i]))
      p[i,14] <- ilogit(f[14] + d[14] * (alpha2[i]))
      p[i,15] <- ilogit(f[15] + d[15] * (alpha2[i]))
      p[i,16] <- ilogit(f[16] + d[16] * (alpha2[i]))
      p[i,17] <- ilogit(f[17] + d[17] * (alpha2[i]))
      p[i,18] <- ilogit(f[18] + d[18] * (alpha2[i]))
      p[i,19] <- ilogit(f[19] + d[19] * (alpha2[i]))
      p[i,20] <- ilogit(f[20] + d[20] * (alpha2[i]))

      p[i,21] <- ilogit(f[21] + d[21] * (alpha1[i] * alpha2[i]))
      p[i,22] <- ilogit(f[22] + d[22] * (alpha1[i] * alpha2[i]))
      p[i,23] <- ilogit(f[23] + d[23] * (alpha1[i] * alpha2[i]))
      p[i,24] <- ilogit(f[24] + d[24] * (alpha1[i] * alpha2[i]))
      p[i,25] <- ilogit(f[25] + d[25] * (alpha1[i] * alpha2[i]))
      p[i,26] <- ilogit(f[26] + d[26] * (alpha1[i] * alpha2[i]))
      p[i,27] <- ilogit(f[27] + d[27] * (alpha1[i] * alpha2[i]))
      p[i,28] <- ilogit(f[28] + d[28] * (alpha1[i] * alpha2[i]))
      p[i,29] <- ilogit(f[29] + d[29] * (alpha1[i] * alpha2[i]))
      p[i,30] <- ilogit(f[30] + d[30] * (alpha1[i] * alpha2[i]))

    }

    # priors for RDINA parameters d and f
    for (i in 1:I) {
      f[i] ~ dgamma(8,2)
      d[i] ~ dbeta(1,1)
    }

    # priors for skill class sizes
    sc1 ~ dbeta(1,1)
    sc2 ~ dbeta(1,1)
  }"
  )

  # Write the string
  writeLines (modelString, con="RDINA.jags")
}
