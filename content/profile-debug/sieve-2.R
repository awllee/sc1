sieve.2 <- function(N) {
  candidates <- rep(TRUE,N)
  candidates[1] <- FALSE
  sqrt.N <- sqrt(N)
  for (i in 2:sqrt.N) {
    if (candidates[i]) {
      # i is prime
      s <- i*i
      while (s <= N) {
        candidates[s] <- FALSE
        s <- s + i
      }
    }
  }
  return((1:N)[candidates])
}
