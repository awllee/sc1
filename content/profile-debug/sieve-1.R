sieve.1 <- function(N) {
  candidates <- rep(TRUE,N)
  candidates[1] <- FALSE
  for (i in 2:N) {
    if (candidates[i]) {
      # i is prime
      s <- i*2
      while (s <= N) {
        candidates[s] <- FALSE
        s <- s + i
      }
    }
  }
  return((1:N)[candidates])
}
