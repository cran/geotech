\name{stressHorizontal}
\alias{stressHorizontal}
\alias{sigmaX}
\alias{sigmaX.profile}
\title{Horizontal Stress Calculations}
\description{These functions calculate horizontal stress at a point
  (sigmaX) and versus depth (sigmaX.profile)}
\usage{
sigmaX(gamma, thk = NA, depth = NA, zw, zout, K, gammaW = NA,
       metric, upper = TRUE)
sigmaX.profile(gamma, thk = NA, depth = NA, K, zw, zout = NA,
               gammaW = NA, metric)
}
\arguments{
  \item{gamma}{vector of unit weights (pcf or kN/m^3)}
  \item{thk}{vector of layer thicknesses (ft or m)}
  \item{depth}{vector of layer bottom depths (ft or m)}
  \item{zw}{depth of groundwater table (ft or m)}
  \item{zout}{desired depth of output (ft or m)}
  \item{K}{vector of lateral earth pressure coefficients}
  \item{gammaW}{unit weight of water (default = 62.4 pcf
    for English units;9.81 kN/m^3 for metric units)}
  \item{metric}{logical variable: TRUE (for metric units)
    or FALSE (for English units)}
  \item{upper}{logical variable when using the sigmaX function
    to specify whether the upper (TRUE) or lower (FALSE) lateral
    earth pressure coefficient should be used, for the special
    case that zout corresponds to a layer interface}
}
\details{
  \itemize{
    \item{Either layer thicknesses or depths to layer bottoms
      must be specified.}
    \item{The argument zout should be a single value for sigmaX,
      and a vector of values for sigmaX.profile.  For sigmaX.profile,
      zout defaults to critical locations in the profile (the top and
      bottom of the profile, layer interfaces, and the groundwater
      table) [recommended].}
  }
}
\value{
  Function sigmaX outputs a three-element list giving the stresses
  at a specified depth:
  \itemize{
    \item{sigmaX.eff = effective horizontal stress}
    \item{sigmaX.total = total horizontal stress}
    \item{u = pore water pressure}
  }
  Function sigmaX.profile outputs a four-element list giving
  the stress variation with depth (four vectors):
  \itemize{
    \item{depth = depth}
    \item{sigmaX.eff = effective horizontal stress}
    \item{sigmaX.total = total horizontal stress}
    \item{u = pore water pressure}
  }
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{lateralEarthPressures}},
  \code{\link{stressPlot}}, \code{\link{stressVertical}}}
\examples{

##  Example code for Horizontal Stress at a point
sigmaX(gamma = c(108, 116), depth = c(15, 40), zout = 18,
       K = c(0.34, 0.32), zw = 15, metric = FALSE, upper = TRUE)

##  Example code for Horizontal Stress Profile
sigmaX.profile(gamma = c(108, 116), depth = c(15, 40),
               K = c(0.34, 0.32), zw = 15, metric = FALSE)
}