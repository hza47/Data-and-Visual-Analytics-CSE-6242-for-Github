log_factorial <- function (n) {
  # Return the log of factorial(n) for any integer n > 0
  if (n <= 1)
    return (0)
  return (log(n) + log_factorial(n - 1))
}

sum_log_factorial <- function (n) {
  # Return the sum of log_factorial(i) for i in 1..n
  sum <- 0
  for(i in seq(1, n, 1)) {
    sum <- sum + log_factorial(i)
  }
  return (sum)
}

fibonacci <- function(n) {
  # Return nth Fibonacci number
  if (n <= 1)
    return (n)
  return (fibonacci(n - 1) + fibonacci(n - 2))
}

#Create a data frame to store fibonacci run times
runtimes_fibonacci_df <- as.data.frame(matrix(0, ncol = 0, nrow = 40))
j = 0
#calculate the run times for fibonacci
n=seq(1, 40, by = 1)
for (i in n)
{
  print (j)
  j = j + 1
  runtimes_fibonacci_df$N[j] = i
  runtimes_fibonacci_df$fibonacci_runtime[j] = system.time(fibonacci(i))
}
qplot(N, runtimes_df$fibonacci_runtime, geom = "line", xlab = "Value of N", ylab = "Run time in seconds")



#Create a data frame to store log_factorial_runtime
runtimes_log_factorial_df <- as.data.frame(matrix(0, ncol = 0, nrow = 400))
options(expressions=500000)
n=seq(10, 4000, by = 10)
j = 0
#Iterate the value of N.
for (i in n)
{
  print (j)
  j = j + 1
  runtimes_log_factorial_df$N[j] = i
  test.res <- microbenchmark(log_factorial(i), times = 10, unit="ms")
  test.summary <- summary(test.res)
  runtimes_log_factorial_df$log_factorial_runtime[j] = test.summary$min
}
qplot(n, runtimes_log_factorial_df$log_factorial_runtime, geom = c("line", "point"), xlab = "Value of N", ylab = "Run time in milli seconds", main = "Run times of log_factorial")






#Create a data frame to store sum_log_factorial_runtime
runtimes_sum_log_factorial_df <- as.data.frame(matrix(0, ncol = 0, nrow = 40))

n=seq(100, 4000, by = 100)
j = 0
#Iterate the value of N.
for (i in n)
{
  print (j)
  j = j + 1
  runtimes_sum_log_factorial_df$N[j] = i
  runtimes_sum_log_factorial_df$log_sum_factorial_runtime[j] = system.time(sum_log_factorial(i))
}
qplot(n, runtimes_sum_log_factorial_df$log_sum_factorial_runtime, geom = c("line", "point"), xlab = "Value of N", ylab = "Run time in seconds", main = "Run times of sum_log_factorial")

