#' Generate the Explicit Priors RUM Jags model
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
  modelString <- paste("model
{
  for(i in 1:I){
    for(j in 1:J){
     for(k in 1:K){
      d[i,j,k] <- rStar[i,k]^((1-alpha[j,k])*q[i,k])
     }
    }
  }

  for(i in 1:I){
    for(j in 1:J){
      x[i,j] ~ dbern(pi[i] * prod(d[i,j,]))
    }
  }

  for(j in 1:J){
    for(k in 1:K){
      alpha[j,k] ~ dbeta(3,3)
    }
  }

  for(i in 1:I){
    pi[i] ~ dbeta(2,2)
  }
")
  writeLines (modelString, con="explicitPriorsRUM.jags")
    for (i in 1:I){
      for (k in 1:K){
        if (q[i,k] == 0){
          write(paste("\t rStar[",i,",",k,"] <- 1", sep=""), file = "explicitPriorsRUM.jags", append=TRUE)
        }
        else{
          write(paste("\t rStar[",i,",",k,"] ~ dunif(0,0.6)", sep=""), file = "explicitPriorsRUM.jags", append=TRUE)
        }
      }
    }
  write("}", file = "explicitPriorsRUM.jags", append=TRUE)
}
