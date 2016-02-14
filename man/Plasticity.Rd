\name{Plasticity}
\alias{Plasticity}
\alias{LL}
\alias{PI}
\alias{LI}
\alias{A.line}
\alias{plasticity.plot}
\title{Plasticity Functions}
\description{
  These functions compute diferent aspects related to
  plasticity:
  \itemize{
    \item{\code{LL} calculates and plots a soil's liquid limit (LL)
      using the flow curve from measured lab data.}
    \item{\code{PI} calculates plasticity index.}
    \item{\code{LI} calculates liquidity index.}
    \item{\code{A.line} calculates the PI corresponding to the
      A-line on Casagrande's plasticity chart.}
    \item{\code{plasticity.plot} plots a soil's plasticity
      parameters on Casagrande's plasticity chart.}
  }
}
\usage{
LL(N, w, draw)
PI(LL, PL)
LI(w, LL, PL)
A.line(LL)
plasticity.plot(LL, PL = NA, PI = NA)
}
\arguments{
  \item{LL}{Liquid Limit (percent)}
  \item{PL}{Plastic Limit (percent)}
  \item{PI}{Plasticity index (percent)}
  \item{w}{moisture content (percent) [see details below]}
  \item{N}{vector of number of blows obtained from the
    liquid limit test (for LL function)}
  \item{draw}{logical variable: TRUE if plot of flow curve
    is desired, and FALSE to suppress the creation of the plot
    (for LL function)}
}
\details{
  \itemize{
    \item{Note that all inputs should be entered as percents, not
      decimals (e.g. w = 23, not w = 0.23)}
    \item{The argument w (water content) should be a single value
      for the LI function that represents the soil's in-situ moisture
      content; and w should be a vector of values for the LL function that
      represent the measured water contents, each with N blows.}
    \item{For plot.plasticity and A.line, either PL or PI must be specified
      in addition to LL.}
  }
}
\value{
  \itemize{
    \item{\code{LL} outputs a soil's liquid limit and, optionally, a
      plot of the soil's flow curve.}
    \item{\code{PI} outputs a two-element list composed of:
      \enumerate{
	\item{PI = Plasticity index (percent)}
	\item{descr = qualitative description of soil based on
	  Sowers (1979)}
      }
    }
    \item{\code{LI} outputs a two-element list composed of:
      \enumerate{
	\item{LI = Liquidity index (percent)}
	\item{descr = qualitative description of soil based on
	  Sowers (1979)}
      }
    }
    \item{\code{A.line} outputs the plasticity index corresponding
      to the A-line on Casagrande's plasticity chart}
    \item{\code{plasticity.plot} is used to make a plot of a
      soil's plasticity parameters (LL and PI) on Casagrande's
      plasticity chart.  No numerical values are output from
      this function.}
  }
}
\references{
  Casagrande, A.M. (1948). "Classification and Identification of
  Soils", ASCE Transactions, Vol. 113, pp. 901-991.

  Sowers, G.F. (1979). "Introductory Soil Mechanics and Foundations:
  Geotechnical Engineering", 4th edition, Macmillan, New York.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{USCS}}, \code{\link{AASHTO}}, \code{\link{grainSize}}}
\examples{

## Example code for Plasticity Index
PI(LL = 80, PL = 30)

## Example code for Liquidity Index
LI(w = 55, PL = 20, LL = 50)

## Example code for plasticity plot
plasticity.plot(LL = 40, PL = 20)

## Example code for liquid limit analysis
LL(N = c(72, 37, 14), w = c(7, 15, 21), draw = TRUE)
}

