generate.primes.upto.1 <- function(N) {
  primes <- 2
  for (i in 3:N) {
    found.divisor <- FALSE
    for (j in primes) {
      if (i %% j == 0) {
        found.divisor <- TRUE
      }
    }
    if (!found.divisor) primes <- c(primes,i)
  }
  return(primes)
}
