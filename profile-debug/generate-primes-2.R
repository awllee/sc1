generate.primes.upto.2 <- function(N) {
  primes <- 2
  for (i in 3:N) {
    found.divisor <- FALSE
    for (j in primes) {
      if (i %% j == 0) {
        found.divisor <- TRUE
        break
      }
    }
    if (!found.divisor) primes <- c(primes,i)
  }
  return(primes)
}
