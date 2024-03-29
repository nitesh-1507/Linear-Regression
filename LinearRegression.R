# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  # setting seed
  set.seed(seed)
  
  # calculate  Y or target
  Y =  (X %*% beta) + rnorm(nrow(X), 0, sigma)
  
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response
calculateBeta <- function(X, Y){
  
  # Calculate beta_LS
  beta_LS = as.numeric(solve(t(X) %*% X) %*% (t(X) %*% Y))

  # Return beta
  return(beta_LS)
}

# Calculate MSE
# beta - given parameter 
# beta_LS - estimated parameter
calculateMSE <- function(beta, beta_LS){
  
  # calculate MSE
  MSE = sum((beta-beta_LS)^2)
  
  
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}