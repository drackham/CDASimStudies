# nohup Rscript R-DINA-STAN-Sim.R | tee R-DINA-STAN-log.txt

library('devtools')
install_github("drackham/dcmdata", ref="feature/continuous")
install_github("drackham/dcms", ref="develop")
library("dcmdata")
library("dcms")
library("rstan")
library('shinystan')


# Configure RSTAN
rstan::rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# Set working directories
wdLocal <- "~/Desktop/Continuous-STAN"
wdRemote <- "/home/drackham/R-DINA-STAN"

# Create simulation folder
#dir.create(paste("R-DINA-STAN/", simID, sep=""))

# Load and save the simulated data
N <- 100
data(continuous_SimpleQ.100)

# Specify which model to use
model <- "continuousDCM.stan"

cores <- 2
iter <- 5000
chains <- cores

# Start the timer!
ptm <- proc.time()

print("Starting simulation...")

# Run the simulation
fit <- continuousStan (model = model, data = continuous_SimpleQ.100, wd = wdLocal,
                cores = cores, iter = iter, chains = chains)

# Stop the timer...
duration <- proc.time() - ptm
duration
totalTime <- as.numeric(duration[3])

print(fit, pars = c("b0"), include = FALSE)

sso <- launch_shinystan(fit)

