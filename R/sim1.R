data <- simplifiedRUMData()
q <- hartzRoussosQLow()

sim1 <- runJagsSim(q, data, adaptSteps = 1000, burnInSteps = 1000, numSavedSteps = 5000)
