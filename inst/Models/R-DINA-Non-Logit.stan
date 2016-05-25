data {
  int<lower=1> I;           // number of examinees
  int<lower=1> J;           // number of items
  int<lower=0, upper=1> y[I,J];            // correctness of examinee on item
}

parameters {
  real<lower=-10, upper=15> fHat[J];              // intercept or baseline probability
  real<lower=-10, upper=15> dHat[J];              // main effect of skill mastery
  real<lower=0, upper=1> alpha1[I];
  real<lower=0, upper=1> alpha2[I];

  real <lower=0, upper=50> a1[I];
  real <lower=0, upper=50> b1[I];
  real <lower=0, upper=50> a2[I];
  real <lower=0, upper=50> b2[I];
}

model {
  # Likelihood
  for (i in 1:I){
    y[i,1] ~ bernoulli(1 / (1 + exp(-fHat[1] - dHat[1] * (alpha1[i]))));
    y[i,2] ~ bernoulli(1 / (1 + exp(-fHat[2] - dHat[2] * (alpha1[i]))));
    y[i,3] ~ bernoulli(1 / (1 + exp(-fHat[3] - dHat[3] * (alpha1[i]))));
    y[i,4] ~ bernoulli(1 / (1 + exp(-fHat[4] - dHat[4] * (alpha1[i]))));
    y[i,5] ~ bernoulli(1 / (1 + exp(-fHat[5] - dHat[5] * (alpha1[i]))));
    y[i,6] ~ bernoulli(1 / (1 + exp(-fHat[6] - dHat[6] * (alpha1[i]))));
    y[i,7] ~ bernoulli(1 / (1 + exp(-fHat[7] - dHat[7] * (alpha1[i]))));
    y[i,8] ~ bernoulli(1 / (1 + exp(-fHat[8] - dHat[8] * (alpha1[i]))));
    y[i,9] ~ bernoulli(1 / (1 + exp(-fHat[9] - dHat[9] * (alpha1[i]))));
    y[i,10] ~ bernoulli(1 / (1 + exp(-fHat[10] - dHat[10] * (alpha1[i]))));

    y[i,11] ~ bernoulli(1 / (1 + exp(-fHat[11] - dHat[11] * (alpha2[i]))));
    y[i,12] ~ bernoulli(1 / (1 + exp(-fHat[12] - dHat[12] * (alpha2[i]))));
    y[i,13] ~ bernoulli(1 / (1 + exp(-fHat[13] - dHat[13] * (alpha2[i]))));
    y[i,14] ~ bernoulli(1 / (1 + exp(-fHat[14] - dHat[14] * (alpha2[i]))));
    y[i,15] ~ bernoulli(1 / (1 + exp(-fHat[15] - dHat[15] * (alpha2[i]))));
    y[i,16] ~ bernoulli(1 / (1 + exp(-fHat[16] - dHat[16] * (alpha2[i]))));
    y[i,17] ~ bernoulli(1 / (1 + exp(-fHat[17] - dHat[17] * (alpha2[i]))));
    y[i,18] ~ bernoulli(1 / (1 + exp(-fHat[18] - dHat[18] * (alpha2[i]))));
    y[i,19] ~ bernoulli(1 / (1 + exp(-fHat[19] - dHat[19] * (alpha2[i]))));
    y[i,20] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[20] * (alpha2[i]))));

    y[i,20] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[20] * (alpha1[i] * alpha2[i]))));
    y[i,21] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[21] * (alpha1[i] * alpha2[i]))));
    y[i,22] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[22] * (alpha1[i] * alpha2[i]))));
    y[i,23] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[23] * (alpha1[i] * alpha2[i]))));
    y[i,24] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[24] * (alpha1[i] * alpha2[i]))));
    y[i,25] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[25] * (alpha1[i] * alpha2[i]))));
    y[i,26] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[26] * (alpha1[i] * alpha2[i]))));
    y[i,27] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[27] * (alpha1[i] * alpha2[i]))));
    y[i,28] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[28] * (alpha1[i] * alpha2[i]))));
    y[i,29] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[29] * (alpha1[i] * alpha2[i]))));
    y[i,30] ~ bernoulli(1 / (1 + exp(-fHat[20] - dHat[30] * (alpha1[i] * alpha2[i]))));

  }
  
  # priors for continous skill mastery
  for (i in 1:I){
    alpha1[i] ~ beta(a1[i],b1[i]);
    alpha2[i] ~ beta(a2[i],b2[i]);

  }

  a1 ~ cauchy(0,5);
  b1 ~ cauchy(0,5);

  a2 ~ cauchy(0,5);
  b2 ~ cauchy(0,5);

  # priors for RDINA parameters d and f
  dHat ~ normal(7,2);
  fHat ~ normal(-3,2);
}
