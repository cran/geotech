\name{stressVertical}
\alias{stressVertical}
\alias{sigmaZ}
\alias{sigmaZ.profile}
\title{Vertical Stress Calculations}
\description{These functions calculate vertical stress at a point
  (sigmaZ) and versus depth (sigmaZ.profile)}
\usage{
sigmaZ(gamma, thk = NA, depth = NA, zw, zout, gammaW = NA, metric)
sigmaZ.profile(gamma, thk = NA, depth = NA, zw, zout = NA,
               gammaW = NA, metric)
}
\arguments{
  \item{gamma}{vector of unit weights (pcf or kN/m^3)}
  \item{thk}{vector of layer thicknesses (ft or m)}
  \item{depth}{vector of layer bottom depths (ft or m)}
  \item{zw}{depth of groundwater table (ft or m)}
  \item{zout}{desired depth of output (ft or m): a single value}
  \item{gammaW}{unit weight of water (default = 62.4 pcf for
    English units; 9.81 kN/m^3 for metric units)}
  \item{metric}{logical variable: TRUE (for metric units) or
    FALSE (for English units)}
}
\details{
  Either layer thicknesses or depths to layer bottoms
  must be specified.
}
\value{
  Function sigmaZ outputs a three-element list giving the stresses
  at a specified depth:
  \itemize{
    \item{sigmaZ.eff = effective vertical stress}
    \item{sigmaZ.total = total vertical stress}
    \item{u = pore water pressure}}
  
  Function sigmaZ.profile outputs a four-element list giving
  the stress variation with depth (four vectors):
  \itemize{
    \item{depth = depth}
    \item{sigmaZ.eff = effective vertical stress}
    \item{sigmaZ.total = total vertical stress}
    \item{u = pore water pressure}}
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{stressHorizontal}}, \code{\link{stressInducedArea}},
  \code{\link{stressInducedPoint}}, \code{\link{stressPlot}}}
\examples{

## Example code for Vertical Stress at a Point
sigmaZ(gamma = c(108, 116), depth = c(15, 40), zout = 18, zw = 15, metric = FALSE)

##  Example code for Vertical Stress Profile
sigmaZ.profile(gamma = c(108, 116), depth = c(15, 40), zw = 15, metric = FALSE)
}