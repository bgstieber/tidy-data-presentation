library(tidyverse) # load package

square <- function(data, exp){
  data$x <- data$x ^ exponent
  data
}

take_sqrt <- function(data){
  data$x <- sqrt(data$x)
  data
}

multiply_by_four <- function(data){
  data$x <- 4 * data$x
  data
}

divide_by_four <- function(data){
  data$x <- data$x / 4
  data
}

(DF <- data.frame(x = 1:10))

take_sqrt(
  divide_by_four(
    multiply_by_four(
      square(DF))))
DF %>%
  square(exponent = 2) %>%
  multiply_by_four() %>%
  divide_by_four() %>%
  take_sqrt()
