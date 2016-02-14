\name{bearingCapacityFactors}
\alias{bearingCapacityFactors}
\alias{Nq}
\alias{Nc}
\alias{Ngamma}
\title{Bearing Capacity Factors}
\description{Calculate the bearing capacity factors (Nc, Nq, Ngamma)
  using either the Terzaghi or Vesic methods.}
\usage{
Nq(phi, case = "general", method = "Terzaghi")
Nc(phi, case = "general", method = "Terzaghi")
Ngamma(phi, case = "general", method = "Terzaghi")
}
\arguments{
  \item{phi}{friction angle (degrees)}
  \item{case}{"general" or "local" to indicate general or local
    shear failure ("general" is default)}
  \item{method}{"Terzaghi" or "Vesic" ("Terzaghi" is default)}
}
\details{
  \itemize{
    \item{For local shear, the friction angle is reduced to a value equal
      to atan(2/3 * tan(phi)).}
    \item{Ngamma from the Terzaghi method uses the
      approximate equation of Coduto et al. (2016).}
  }
}
\value{Bearing capacity factor (Nc, Nq, or Ngamma)}
\references{
  Coduto, D.P., Kitch, W.A., and Yeung, M.R. (2016). Foundation Design:
  Principles and Practices, Pearson, Boston.
  
  Terzaghi, K. (1943). Theoretical Soil Mechanics, John Wiley, New York

  Vesic, A.S. (1973).  Analysis of Ultimate Loads of Shallow
  Foundations, ASCE Journal of the Soil Mechanics and Foundations
  Division, Vol. 99, No. SM1, pp. 45-73.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{bearingCapacity}}, \code{\link{bearingPressure}}}
\examples{
Nq(phi = 20, case = "local", method = "Terzaghi")
Nc(phi = 20, case = "local", method = "Terzaghi")
Ngamma(phi = 20, case = "local", method = "Terzaghi")
}
