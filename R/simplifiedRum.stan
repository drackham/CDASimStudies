data {
  int<lower=1> I;                 // number of items
  int<lower=1> J;                 // number of examinees
  int<lower=1> K;                 // number of skills
  int<lower=1> N;                 // number of observations
  int<lower=1,upper=J> jj[N];     // student for observation n
  int<lower=1,upper=I> ii[N];     // item for observation n
  int<lower=0,upper=1> y[N];      // correctness of observation n
}
parameters {
  real delta;                    // mean student ability
  real alpha[J];                 // ability of student j - mean ability
  real beta[K];                  // difficulty of question k

  real rStar[K];                  // difficulty of question k
  real alpha[K];                  // difficulty of question k
  real<lower=0> sigma_alpha;     // sd of student abilities
  real <lower=0> sigma_beta;     // sd of question difficulties
}
model {
  alpha ~ normal(0,sigma_alpha);
  beta ~ normal(0,sigma_beta);
  delta ~ normal(.75,1);          // informative around known value

  rStar ~ normal(0,1);
  alpha ~ normal(0,1);

  for (n in 1:N) {
    for (k in 1:K){
      x[n] ~ bernoulli_logit(prod(rStar[ii[k]]^((1-alpha[ii[k]])*q)));
    }
  }

}
