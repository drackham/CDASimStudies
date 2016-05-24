data {
  int<lower=1> I;               // # persons
  int<lower=1> J;               // # items
  int<lower=1> N;               // # observations
  int<lower=1, upper=I> ii[N];  // question for n
  int<lower=1, upper=J> jj[N];  // person for n
  int<lower=0, upper=1> y[N];   // correctness for n
}
parameters {    
  real theta[I];               // ability of student i - mean ability
  real beta[J];                // difficulty of question j
  // real delta;                  // mean student ability
}
model {
  theta ~ normal(0,1);         // informative true prior
  beta ~ normal(0,1);          // informative true prior
  // delta ~ normal(.75,1);       // informative true prior
  
  for (n in 1:N)
    // y[n] ~ bernoulli_logit(theta[jj[n]] - beta[kk[n]] + delta);
    y[n] ~ bernoulli_logit(theta[ii[n]] - beta[jj[n]]);
}

