\name{stressInducedArea}
\alias{stressInducedArea}
\alias{induced.area}
\alias{induced.area.profile}
\title{Induced Stress due to Area Loads}
\description{These functions calculate induced stresses due to
  an area load applied at the surface: induced.area performs this
  calculation at a specific depth, induced.area.profile performs
  this calculation at a series of depths.}
\usage{
induced.area(z, q, B, L = NA, shape)
induced.area.profile(z = NA, q, B, L = NA, shape)
}
\arguments{
  \item{z}{depth(s) of interest}
  \item{q}{applied pressure at ground surface}
  \item{B}{width of loaded area}
  \item{L}{length of loaded area (rectangular foundations only)}
  \item{shape}{shape of loaded area (a string containing "circle",
    "square", "strip", or "rectangle")}
}
\details{
  \itemize{
    \item{The depth(s) of interest (z) should be a single value for
      induced.point, and a vector of values for induced.point.profile.
      For induced.point.profile, the default vector of z values is
      1-ft or 1-m increments, to a maximum depth of 50 ft or 50 m.}
    \item{This function currently uses the approximate method of
      Poulos and Davis (1974).  More advanced formulations are
      expected in future versions of this package.
    }
  }
}
\value{
  Function induced.area outputs the induced vertical stress at
  the center of the loaded area.

  Function induced.area.profile outputs a two-element list containing
  two vectors:
  \itemize{
    \item{depth = vector of depths}
    \item{sigmaZ = vector of induced vertical stresses below
      center of the loaded area}
  }
}
\references{
  Poulos, H.G., and Davis, E.H. (1974). Elastic Solutions for Soil
  and Rock Mechanics, John Wiley, New York.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{stressInducedPoint}},
  \code{\link{stressVertical}}, \code{\link{stressHorizontal}}}
\examples{
##  Example code for Induced Stress due to Area Load
induced.area(z = 10, q = 1000, B = 3, shape = "square")

##  Example code for Induced Stress due to Area Load: Profile
induced.area.profile(q = 1000, B = 3, shape = "square")
}
