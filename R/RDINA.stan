data {
  int<lower=1> I;           // number of examinees
  int<lower=1> J;           // number of items
  int<lower=1> K;           // number of skills
  int<lower=0, upper=1> y[I,J];            // correctness of examinee on item
}

parameters {
  real fHat[J];              // intercept or baseline probability
  real dHat[J];              // main effect of skill mastery
  real<lower=0, upper=1> alpha1[I];
  real<lower=0, upper=1> alpha2[I];
  real <lower=0> a1[I];
  real <lower=0> b1[I];
  real <lower=0> a2[I];
  real <lower=0> b2[I];
}


model {
  # priors for continous skill mastery
  for (i in 1:I){
    alpha1[i] ~ beta(a1[i],b1[i]);
    alpha2[i] ~ beta(a2[i],b2[i]);
  }

//   a1 ~ cauchy(0,5);
//   b1 ~ cauchy(0,5);
  a1 ~ gamma(2,2);
  b1 ~ gamma(2,2);

//   a2 ~ cauchy(0,5);
//   b2 ~ cauchy(0,5);
  a2 ~ gamma(2,2);
  b2 ~ gamma(2,2);

  # priors for RDINA parameters d and f
  dHat ~ normal(7,2);
  fHat ~ normal(-3,2);

  for (i in 1:I){
    y[i,1] ~ bernoulli_logit(fHat[1] + (dHat[1] * alpha1[i]));
    y[i,2] ~ bernoulli_logit(fHat[2] + (dHat[2] * alpha1[i]));
    y[i,3] ~ bernoulli_logit(fHat[3] + (dHat[3] * alpha1[i]));
    y[i,4] ~ bernoulli_logit(fHat[4] + (dHat[4] * alpha1[i]));
    y[i,5] ~ bernoulli_logit(fHat[5] + (dHat[5] * alpha1[i]));
    y[i,6] ~ bernoulli_logit(fHat[6] + (dHat[6] * alpha1[i]));
    y[i,7] ~ bernoulli_logit(fHat[7] + (dHat[7] * alpha1[i]));
    y[i,8] ~ bernoulli_logit(fHat[8] + (dHat[8] * alpha1[i]));
    y[i,9] ~ bernoulli_logit(fHat[9] + (dHat[9] * alpha1[i]));
    y[i,10] ~ bernoulli_logit(fHat[10] + (dHat[10] * alpha1[i]));

    y[i,11] ~ bernoulli_logit(fHat[11] + (dHat[11] * alpha2[i]));
    y[i,12] ~ bernoulli_logit(fHat[12] + (dHat[12] * alpha2[i]));
    y[i,13] ~ bernoulli_logit(fHat[13] + (dHat[13] * alpha2[i]));
    y[i,14] ~ bernoulli_logit(fHat[14] + (dHat[14] * alpha2[i]));
    y[i,15] ~ bernoulli_logit(fHat[15] + (dHat[15] * alpha2[i]));
    y[i,16] ~ bernoulli_logit(fHat[16] + (dHat[16] * alpha2[i]));
    y[i,17] ~ bernoulli_logit(fHat[17] + (dHat[17] * alpha2[i]));
    y[i,18] ~ bernoulli_logit(fHat[18] + (dHat[18] * alpha2[i]));
    y[i,19] ~ bernoulli_logit(fHat[19] + (dHat[19] * alpha2[i]));
    y[i,20] ~ bernoulli_logit(fHat[20] + (dHat[20] * alpha2[i]));

    y[i,21] ~ bernoulli_logit(fHat[21] + (dHat[21] * alpha1[i] * alpha2[i]));
    y[i,22] ~ bernoulli_logit(fHat[22] + (dHat[22] * alpha1[i] * alpha2[i]));
    y[i,23] ~ bernoulli_logit(fHat[23] + (dHat[23] * alpha1[i] * alpha2[i]));
    y[i,24] ~ bernoulli_logit(fHat[24] + (dHat[24] * alpha1[i] * alpha2[i]));
    y[i,25] ~ bernoulli_logit(fHat[25] + (dHat[25] * alpha1[i] * alpha2[i]));
    y[i,26] ~ bernoulli_logit(fHat[26] + (dHat[26] * alpha1[i] * alpha2[i]));
    y[i,27] ~ bernoulli_logit(fHat[27] + (dHat[27] * alpha1[i] * alpha2[i]));
    y[i,28] ~ bernoulli_logit(fHat[28] + (dHat[28] * alpha1[i] * alpha2[i]));
    y[i,29] ~ bernoulli_logit(fHat[29] + (dHat[29] * alpha1[i] * alpha2[i]));
    y[i,30] ~ bernoulli_logit(fHat[30] + (dHat[30] * alpha1[i] * alpha2[i]));
  }
}
