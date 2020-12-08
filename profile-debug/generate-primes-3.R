any.divisors <- function(i, ps) {
  for (j in ps) {
    if (i %% j == 0) {
      return(TRUE)
    }
  }
  return(FALSE)
}

generate.primes.upto.3 <- function(N) {
  primes <- 2
  for (i in 3:N) {
    if (!any.divisors(i, primes)) {
      primes <- c(primes,i)
    }
  }
  return(primes)
}
