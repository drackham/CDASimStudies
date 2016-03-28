data {
  int<lower=1> I;           // number of items
  int<lower=1> J;           // number of examinees
  int<lower=1> K;           // number of skills
  matrix[I,K] q;            // Q matrix
  matrix[I,J] x;            // correctness of examinee on item
}

parameters {
  matrix[I,K] rStar;        // difficulty of question k
  matrix[J,K] alpha;        // difficulty of question k
  real<lower=0> d[I,J,K];   // bernoulli placeholder
}

// transformed parameters {
//   for(i in 1:I){ # Items
//     for(j in 1:J){ # Examinees
//       for(k in 1:K){ # Skills
//         d[i,j,k] <- rStar[i,k]^((1-alpha[j,k])*q[i,k]);
//       }
//     }
//   }
// }

model {
  for (i in 1:I){ # Items
    for(k in 1:K){ # Skills
      rStar[i,k] ~ beta(2,2);
    }
  }

  for (j in 1:J){ # Examinees
    for (k in 1:K){ # Skills
      alpha[j,k] ~ beta(2,2);
    }
  }

  for(i in 1:I){ # Items
    for(j in 1:J){ # Examinees
      for(k in 1:K){ # Skills
        d[i,j,k] <- rStar[i,k]^((1-alpha[j,k])*q[i,k]);
      }
    }
  }


  for(i in 1:I){  # Item
    for(j in 1:J){ # Respondents
        x[i,j] ~ bernoulli(prod(d[i,j,]))
      }
    }
  }
}





