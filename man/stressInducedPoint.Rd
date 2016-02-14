\name{stressInducedPoint}
\alias{stressInducedPoint}
\alias{induced.point}
\alias{induced.point.profile}
\title{Induced Stress due to Point Loads}
\description{These functions calculate induced stresses due to
  a point load applied at the surface: induced.point performs this
  calculation at a specific depth, induced.point.profile performs
  this calculation at a series of depths.}
\usage{
induced.point(P, x, y, z, nu)
induced.point.profile(P, x, y, z = NA, nu)
}
\arguments{
  \item{P}{point load}
  \item{x}{horizontal distance from point load in the x direction}
  \item{y}{horizontal distance from point load in the y direction}
  \item{z}{depth(s) of interest}
  \item{nu}{Poisson's ratio}
}
\details{
  The depth(s) of interest (z) should be a single value for
  induced.point, and a vector of values for induced.point.profile.
  For induced.point.profile, the default vector of z values is
  1-ft or 1-m increments, to a maximum depth of 50 ft or 50 m.
}
\value{
  Function induced.point outputs a six-element list giving the induced
  stress at a specified depth using the Boussinesq (1885) theory.
  \itemize{
    \item{sigmaX = induced horizontal stress in the x direction}
    \item{sigmaY = induced horizontal stress in the y direction}
    \item{sigmaZ = induced vertical stress}
    \item{tauZX = induced shear stress on the ZX plane}
    \item{tauYX = induced shear stress on the YX plane}
    \item{tauYZ = induced shear stress on the YZ plane}
  }
  Function induced.point.profile outputs a seven-element list containing
  seven vectors that display the depth variation of induced stresses
  using the Boussinesq (1885) theory.
  \itemize{
    \item{depth = depth}
    \item{sigmaX = induced horizontal stress in the x direction}
    \item{sigmaY = induced horizontal stress in the y direction}
    \item{sigmaZ = induced vertical stress}
    \item{tauZX = induced shear stress on the ZX plane}
    \item{tauYX = induced shear stress on the YX plane}
    \item{tauYZ = induced shear stress on the YZ plane}
  }
}
\references{
  Boussinesq, J. (1885). "Application des Potentiels a L'Etude de
  L'Equilibre et du Mouvement des Solides Elastiques",
  Gauthier-Villars, Paris (in French).
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{stressInducedArea}},
  \code{\link{stressVertical}}, \code{\link{stressHorizontal}}}
\examples{
##  Example code for Induced Stress due to a Point Load
induced.point(P = 100000, x = 5, y = 2, z = 6, nu = 0.35)

##  Example code for Induced Stress due to a Point Load: Profile
induced.point.profile(P = 100000, x = 5, y = 2, nu = 0.35)
}


