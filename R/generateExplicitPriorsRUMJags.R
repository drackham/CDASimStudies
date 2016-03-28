#' Generate the Explicit Priors RUM Jags model
#'
#' @return
#' @export
#'
#' @examples
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
      x[i,j] ~ dbern(prod(d[i,j,]))
    }
  }

  for(j in 1:J){
    for(k in 1:K){
      alpha[j,k] ~ dbeta(3,3)
    }
  }
")
  writeLines (modelString, con="explicitPriorsRUM.jags")
    for (i in 1:I){
      for (k in 1:K){
        if (q[i,k] == 1){
          write(paste("\t rStar[",i,",",k,"] ~ dunif(0.95,1)", sep=""), file = "explicitPriorsRUM.jags", append=TRUE)
        }
        else{
          write(paste("\t rStar[",i,",",k,"] ~ dbeta(2,8)", sep=""), file = "explicitPriorsRUM.jags", append=TRUE)
        }
      }
    }
  write("}", file = "explicitPriorsRUM.jags", append=TRUE)
}
