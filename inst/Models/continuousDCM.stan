data {
  int<lower=1> I;                           // number of examinees
  int<lower=1> J;                           // number of items
  int<lower=0, upper=1> y[I,J];             // correctness of examinee on item
}

parameters {
  real b0[J];                 // intercept or baseline probability
  real b1[J];              // main effect of skill 1 mastery
  real b2[J];              // main effect of skill 2 mastery
  real<lower=0, upper=1> alpha1[I];
  real<lower=0, upper=1> alpha2[I];

  //   real <lower=0.001> a1;
  //   real <lower=0.001> b1;
  //   real <lower=0.001> a2;
  //   real <lower=0.001> b2;
}

model {
  # Likelihood
  for (i in 1:I){
    y[i,1] ~ bernoulli (1 / (1 + exp(b0[1] + b1[1] * alpha1[i])));
    y[i,2] ~ bernoulli (1 / (1 + exp(b0[2] + b1[2] * alpha1[i])));
    y[i,3] ~ bernoulli (1 / (1 + exp(b0[3] + b1[3] * alpha1[i])));
    y[i,4] ~ bernoulli (1 / (1 + exp(b0[4] + b1[4] * alpha1[i])));
    y[i,5] ~ bernoulli (1 / (1 + exp(b0[5] + b1[5] * alpha1[i])));
    y[i,6] ~ bernoulli (1 / (1 + exp(b0[6] + b1[6] * alpha1[i])));
    y[i,7] ~ bernoulli (1 / (1 + exp(b0[7] + b1[7] * alpha1[i])));
    y[i,8] ~ bernoulli (1 / (1 + exp(b0[8] + b1[8] * alpha1[i])));
    y[i,9] ~ bernoulli (1 / (1 + exp(b0[9] + b1[9] * alpha1[i])));
    y[i,10] ~ bernoulli (1 / (1 + exp(b0[10] + b1[10] * alpha1[i])));

    y[i,11] ~ bernoulli (1 / (1 + exp(b0[11] + b2[11] * alpha2[i])));
    y[i,12] ~ bernoulli (1 / (1 + exp(b0[12] + b2[12] * alpha2[i])));
    y[i,13] ~ bernoulli (1 / (1 + exp(b0[13] + b2[13] * alpha2[i])));
    y[i,14] ~ bernoulli (1 / (1 + exp(b0[14] + b2[14] * alpha2[i])));
    y[i,15] ~ bernoulli (1 / (1 + exp(b0[15] + b2[15] * alpha2[i])));
    y[i,16] ~ bernoulli (1 / (1 + exp(b0[16] + b2[16] * alpha2[i])));
    y[i,17] ~ bernoulli (1 / (1 + exp(b0[17] + b2[17] * alpha2[i])));
    y[i,18] ~ bernoulli (1 / (1 + exp(b0[18] + b2[18] * alpha2[i])));
    y[i,19] ~ bernoulli (1 / (1 + exp(b0[19] + b2[19] * alpha2[i])));
    y[i,20] ~ bernoulli (1 / (1 + exp(b0[20] + b2[20] * alpha2[i])));

    y[i,21] ~ bernoulli (1 / (1 + exp(b0[21] + b1[21] * alpha1[i] + b2[21] * alpha2[i])));
    y[i,22] ~ bernoulli (1 / (1 + exp(b0[22] + b1[22] * alpha1[i] + b2[22] * alpha2[i])));
    y[i,23] ~ bernoulli (1 / (1 + exp(b0[23] + b1[23] * alpha1[i] + b2[23] * alpha2[i])));
    y[i,24] ~ bernoulli (1 / (1 + exp(b0[24] + b1[24] * alpha1[i] + b2[24] * alpha2[i])));
    y[i,25] ~ bernoulli (1 / (1 + exp(b0[25] + b1[25] * alpha1[i] + b2[25] * alpha2[i])));
    y[i,26] ~ bernoulli (1 / (1 + exp(b0[26] + b1[26] * alpha1[i] + b2[26] * alpha2[i])));
    y[i,27] ~ bernoulli (1 / (1 + exp(b0[27] + b1[27] * alpha1[i] + b2[27] * alpha2[i])));
    y[i,28] ~ bernoulli (1 / (1 + exp(b0[28] + b1[28] * alpha1[i] + b2[28] * alpha2[i])));
    y[i,29] ~ bernoulli (1 / (1 + exp(b0[29] + b1[29] * alpha1[i] + b2[29] * alpha2[i])));
    y[i,30] ~ bernoulli (1 / (1 + exp(b0[30] + b1[30] * alpha1[i] + b2[30] * alpha2[i])));
  }

  # priors for continous skill mastery
  //   for (i in 1:I){
    //     alpha1[i] ~ beta(a1,b1);
    //     alpha2[i] ~ beta(a2,b2);
    //   }

  # priors for betas
  b0 ~ normal(0, 10);
  b1 ~ normal(0, 10);
  b2 ~ normal(0, 10);
}
