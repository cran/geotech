\name{bearingPressure}
\alias{bearingPressure}
\title{Bearing Pressure}
\description{This function computes the gross bearing pressure that a
  soil would experience due to a foundation.}
\usage{bearingPressure(P, B, L, D, Dw, metric, gammaW = NA, gammaC = NA)}
\arguments{
  \item{P}{Vertical gross column load (lb or kN)}
  \item{B}{foundation width (ft or m)}
  \item{L}{foundation length (ft or m)}
  \item{D}{Depth of foundation (ft or m)}
  \item{Dw}{Depth of groundwater table below foundation base (ft or m)}
  \item{metric}{logical variable: TRUE (for metric units) or FALSE (for English units)}
  \item{gammaW}{unit weight of water (default = 62.4 pcf for English
    units; 9.81 kN/m^3 for metric units)}
  \item{gammaC}{unit weight of concrete (default = 150 pcf for English
    units; 23.6 kN/m^3 for metric units)}
}
\details{
  \itemize{
    \item{Either SI or English units can be used, but must stay consistent.}
    \item{When specifying the length and width, L should be the longer
      of the two lengths.}
    \item{For a continuous (strip) foundation, specify L = 1 and specify
      P as the load per unit length.}
    \item{When the groundwater table is deep or unknown, set Dw >= D.}}
}
\value{Gross bearing pressure of footing (psf or kPa)}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{bearingPressure}}, \code{\link{bearingCapacityFactors}}}
\examples{
##  Calculation of bearing pressure under a rectangular footing
bearingPressure(P = 1000, B = 2, L = 5, D = 6, Dw = 2, metric = FALSE)
}
