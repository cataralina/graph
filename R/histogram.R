#' @title Visualization of the distribution of a single variable using histograms
#'
#' @description This function displays the distribution of a single numeric variable
#' through a histogram
#'
#' @param data Default data set that supplies the data to generate the plot
#' @param x Column that contains a vector of numbers for plot
#' @param xlab Text that will be used for the title of the x axis
#' @param bins Specify the number of bins. Defaults to 30
#' could change this value, exploring multiple numbers of bins to find the best to
#' illustrate the stories in your data.
#' @param na.rm A logical vector indicating whether NA values
#' should be stripped before the computation proceeds. TRUE is the default.
#'
#' @return  A histogram showing the distribution of x
#'
#'
#'
#' @export
histogram <- function(data, x, xlab = "x" , bins = 30, na.rm = TRUE){
  if(!is.numeric(eval(substitute(x), data))){# to make the function stop if the variable is not numeric
    stop("This function only works for numeric input!\n",
         "you have provided an object of class:", class(eval(substitute(x), data))[1])
  }
  h <- ggplot2::ggplot(data, ggplot2::aes({{ x }}))+
    ggplot2::geom_histogram(ggplot2::aes(y = ..density..),
                   fill = ("#ef8a62"),
                   color = "black",
                   alpha = 0.6,
                   bins = {{ bins }})+
    ggplot2::geom_vline(ggplot2::aes(xintercept = mean({{ x }}, na.rm = na.rm)),
               color="red",
               size = 1)+
    ggplot2::labs(x= paste({{ xlab }}),
         y="Density") +
    ggplot2::theme_classic()
  return(h)
}

