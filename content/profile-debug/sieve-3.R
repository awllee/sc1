get.multiples <- function(i, N) {
  n <- floor(N/i) - i
  if (n <= 0) return(NULL)
  multiples <- seq(i*i,(i+n)*i,i)
  return(multiples)
}

sieve.3 <- function(N) {
  candidates <- rep(TRUE,N)
  candidates[1] <- FALSE
  sqrt.N <- sqrt(N)
  for (i in 2:sqrt.N) {
    if (candidates[i]) {
      multiples <- get.multiples(i, N)
      candidates[multiples] <- FALSE
    }
  }
  return((1:N)[candidates])
}
