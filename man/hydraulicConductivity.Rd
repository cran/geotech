\name{hydraulicConductivity}
\alias{hydraulicConductivity}
\alias{kConstant}
\alias{kFalling}
\alias{kx}
\alias{kz}
\title{Hydraulic Conductivity}
\description{These functions are used to calculate a soil's hydraulic
  conductivity from standard laboratory tests (\code{kConstant} for
  the constant head test and \code{kFalling} for the falling head test),
  and to calculate the equivalent horizontal and vertical hydraulic
  conductivity for layered soil deposits (\code{kx} and \code{kz},
  respectively).}
\usage{
kConstant(V, t, h, L, As = NA, Ds = NA)
kFalling(h0, hf, t, L, As = NA, Ap = NA, Ds = NA, Dp = NA)
kx(thk, k)
kz(thk, k)
}
\arguments{
  \item{t}{time of flow}
  \item{L}{length of soil sample}  
  \item{As}{cross-sectional area of the soil sample}
  \item{Ds}{diameter of soil sample}
  \item{V}{volume of water collected (constant head test)}
  \item{h}{head difference between inflow and outflow (constant
    head test)}
  \item{h0}{head difference at beginning of test (falling head test)}
  \item{hf}{head difference at end of test (h0 > hf; falling head test)}
  \item{Ap}{cross-sectional area of the standpipe (falling head test)}
  \item{Dp}{diameter of the standpipe (falling head test)}
  \item{thk}{vector of layer thicknesses}
  \item{k}{vector of hydraulic conductivities}
}
\details{
  \itemize{
    \item{Either English or metric units can be used, but they must be
      consistent.}
    \item{Either the areas or the diameters of the soil sample
      (or standpipe) need to be specified.}
  }
}
\value{
  \itemize{
    \item{kConstant calculates the measured hydraulic conductivity
      from the constant head test}
    \item{kFalling calculates the measured hydraulic conductivity
      from the falling head test}
    \item{kx calculates the equivalent hydraulic conductivity
      in the horizontal direction for a layered soil deposit}
    \item{kz calculates the equivalent hydraulic conductivity
      in the vertical direction for a layered soil deposit}
  }
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{wellHydraulics}}}
\examples{

##  Example code for Hydraulic Conductivity from Constant head test
##  k in units of cm/s
kConstant(V = 800, t = 100, h = 200, A = 40, L = 50)

##  Example code for Hydraulic Conductivity from Falling head test
##  k in units of cm/s
kFalling(h0 = 12, hf = 2, L = 10, Ds = 20, Dp = 2, t = 100)
}