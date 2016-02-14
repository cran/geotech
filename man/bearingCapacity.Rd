\name{bearingCapacity}
\alias{bearingCapacity}
\title{Ultimate Bearing Capacity}
\description{This function computes the ultimate bearing
  capacity of a shallow foundation using the simple theory of
  Terzaghi (1943).
}
\usage{
bearingCapacity(phi, c, B, L, D, Dw, gamma, gammaW = NA, metric,
                case = "general", shape = "square")
}
\arguments{
  \item{phi}{effective friction angle (deg)}
  \item{c}{effective cohesion (psf or kPa)}
  \item{B}{foundation width (ft or m),
    or foundation diameter for circular footings}
  \item{L}{foundation length (ft or m)}
  \item{D}{Depth of foundation (ft or m)}
  \item{Dw}{Depth of groundwater table below foundation base (ft or m)}
  \item{gamma}{unit weight of soil (pcf or kN/m^3)}
  \item{gammaW}{unit weight of water (default = 62.4 pcf for English
    units; 9.81 kN/m^3 for metric units)}
  \item{case}{"general" or "local" to indicate general or
    local shear failure ("general" is default)}
  \item{shape}{"square", "rectangle", "circle", "strip" (or
    "continuous")}
  \item{metric}{logical variable: TRUE (for metric units)
    or FALSE (for English units)}
}
\details{
  \itemize{
    \item{Either SI or English units can be used, but must stay consistent.}
    \item{When specifying the length and width, L should be the longer
      of the two lengths.}
    \item{When the groundwater table is deep or unknown, set Dw >= D.}
    \item{For local shear, the friction angle is reduced to a value equal
      to atan(2/3 * tan(phi)).}
    \item{For local shear, the cohesion is reduced to a value equal
      to 2/3*c.}
  }
}
\value{Bearing capacity (q_ult) from Terzaghi's simple theory (psf or
  kPa)}
\references{
  Terzaghi, K. (1943). Theoretical Soil Mechanics, John Wiley, New York.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{bearingPressure}},
  \code{\link{bearingCapacityFactors}}}
\examples{
bearingCapacity(phi = 30, c = 10, B = 10, L = 10, D = 8, Dw = 6,
                gamma = 120, metric = FALSE, case = "local",
                shape = "square")
}
