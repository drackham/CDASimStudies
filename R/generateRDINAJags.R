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
generateExplicitPriorsRUMJags <- function(I, J, K, q){
  modelString <- paste(
"model
  {
    for (i in 1:N) { # respondents
      for (j in 1:J) {# items
        y[i,j] ~ dbern(p[i,j])
      }
    }

    for (i in 1:N) {
    alpha1[i] ~ dbern(sc1)
    alpha2[i] ~ dbern(sc2)

    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i])

    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha2[i])

    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])
    p[i,1] <- logit(f[1] + d[1] * (alpha1[i] * alpha2[i])

    }

    #priors for RDINA parameters d and f
    for (j in 1:J) {
      f[j] ~ dnorm(0, 0.1)
      d[j] ~ dnorm(0, 0.1) I(0,)
    }

    #priors for skill class sizes
    sc1 ~ dbeta(1,1)
    sc2 ~ dbeta(1,1)
  }"
  )
}
