#' A Dummy Function 1
#'
#' This function returns "Hello from function 1!"
#' @export
dummy_function1 <- function() {
  return("Hello from function 1!")
}

#' A Dummy Function 2
#'
#' This function calculates the square of a number.
#' @param x A numeric value.
#' @export
dummy_function2 <- function(x) {
  return(x^2)
}

#' A Dummy Function 3
#'
#' This function concatenates two strings.
#' @param a A string.
#' @param b Another string.
#' @export
dummy_function3 <- function(a, b) {
  return(paste(a, b))
}

#' A Dummy Function 4
#'
#' This function generates a sequence from 1 to n.
#' @param n A positive integer.
#' @export
dummy_function4 <- function(n) {
  return(seq(1, n))
}

#' A Dummy Function 5
#'
#' This function returns the mean of a numeric vector.
#' @param v A numeric vector.
#' @export
dummy_function5 <- function(v) {
  return(mean(v, na.rm = TRUE))
}

