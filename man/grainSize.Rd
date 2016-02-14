\name{grainSize}
\alias{grainSize}
\alias{size.from.sieve}
\alias{grainSize.plot}
\alias{percentComponents}
\alias{Dsize}
\alias{grainSize.coefs}
\title{Grain-Size Distribution Functions}
\description{These functions compute diferent aspects related to
  grain-size distributions of soil.}
\usage{
size.from.sieve(sieve, metric)
grainSize.plot(sieve = NA, size = NA, percent, metric)
percentComponents(sieve = NA, size = NA, percent, metric)
Dsize(N, sieve = NA, size = NA, percent, metric)
grainSize.coefs(percent, sieve = NA, size = NA, D10 = NA,
                D30 = NA, D60 = NA)
}
\arguments{
  \item{sieve}{vector of sieve numbers according to ASTM D422}
  \item{size}{vector of grain sizes (in or mm)}
  \item{percent}{vector of percent passing}
  \item{metric}{logical variable: TRUE for metric units (mm),
    FALSE for English units (in)}
  \item{N}{the percent corresponding to the desired D-size}
  \item{D10}{D-size corresponding to 10 percent passing}
  \item{D30}{D-size corresponding to 30 percent passing}
  \item{D60}{D-size corresponding to 60 percent passing}
}
\details{
  \itemize{
    \item{Either sieve numbers (\code{sieve}) OR grain sizes
      (\code{size}) must be provided in all functions; however,
      in grainSize.coefs the user additionally has the option of
      specifying D10, D30, and D60.}
    \item{For sieves larger than the no. 4 sieve, the user should
      specify the sieve size in inches (e.g., 3/8, 3/4, 1, 1.5, 2,
      3, etc.).}
    \item{The argument \code{percent} is required in all functions
      except size.from.sieve, and the argument \code{metric}
      is required in all functions except for grainSize.coefs and
      Dsize (although it is needed in Dsize if sieve numbers are
      provided).}
    \item{The percentComponents function assumes that the no. 4
      and no. 200 sieves have been used.}
  }
}
\value{
  \itemize{
    \item{sieve.from.size calculates a set of grain sizes corresponding
      to a set of sieves (output is vector of grain sizes (in or mm)}
    \item{grainSize.plot creates a plot of the soil's grain-size
      distribution; no numerical values are output}
    \item{percentComponents is used to calculate the percent gravel,
      sand, and fines, and outputs a three-element list:
      \enumerate{
	\item{pg = Percent gravel}
	\item{ps = percent sand}
	\item{pf = percent fines}
      }
    }
    \item{Dsize outputs the grain size corresponding to a certain
      percent finer (N), given a grain-size distribution}
    \item{grainSize.coefs calculates the coefficients of uniformity
      and curvature, and outputs a two-element list:
      \enumerate{
	\item{Cu = Coefficient of uniformity (D60 / D10)}
	\item{Cc = Coefficient of Curavture (D30^2 / (D10 * D60))}
      }
    }
  }
}
\note{
  The Dsize function uses logarithmic interpolation to calculate the
  D-size from the provided grain-size distribution.  Log-linear
  extrapolation is used for grain sizes beyond the range of the data,
  and a warning is provided.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{USCS}}, \code{\link{AASHTO}}, \code{\link{Plasticity}}}
\examples{

##  Example 1:  Grain-size distribution

##  (a) Define data
sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82)

##  (b) Percent gravel, sand, and fines
percentComponents(sieve = sieve.example, percent = percent.example,
                  metric = TRUE)

##  (c) Plot grain-size distribution
grainSize.plot(sieve = sieve.example, percent = percent.example,
               metric = TRUE)

##  (d) Calculate D50
Dsize(N = 50, sieve = sieve.example, percent = percent.example,
      metric = TRUE)

##  (e) Coefficients of uniformity and curvature
grainSize.coefs(sieve = sieve.example, percent = percent.example)


##  Example 2:  coefficients of uniformity and curvature
grainSize.coefs(D60 = 0.10, D30 = 0.03, D10 = 0.002)  
}
