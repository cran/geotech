\name{plotBackground}
\alias{plotBackground}
\alias{logAxis.plot}
\alias{logAxis}
\title{Background Functions for Plotting}
\description{These internal functions are called by the package's
  plotting functions to create logarithmic axes.}
\usage{
logAxis(x = NA, y = NA, gridX = FALSE, gridY = FALSE)
logAxis.plot(data, type, gridlines)
}
\arguments{
  \item{x}{data for x-axis}
  \item{y}{data for y-axis}
  \item{gridX}{TRUE if gridlines in the vertical directions
    are to be drawn; FALSE otherwise (default = FALSE).}
  \item{gridY}{TRUE if gridlines in the horizontal directions
    are to be drawn; FALSE otherwise (default = FALSE).}
  \item{data}{vector of data values for plot}
  \item{type}{"x" for horizontal axis; "y" for vertical axis}
  \item{gridlines}{TRUE for vertical gridlines across plot,
    FALSE otherwise (default = FALSE).}
}
\details{
  \itemize{
    \item{logAxis is a wrapper function for performing calculations}
    \item{logAxis.plot is the actual plotting function (which is called
      one axis at a time).}
  }
}
\value{No numerical values are returned by these functions;
  they are simply used to draw logarithmic axes on existing
  plots.}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\keyword{internal}