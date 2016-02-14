\name{slopeStability}
\alias{slopeStability}
\alias{FSinf}
\alias{FSplanar}
\title{Slope Stability}
\description{These functions are used to determine the factor of
  safety against shear failure on slopes using infinite slope analyses
  (FSinf) or planar failure analyses (FSplanar).}
\usage{
FSinf(c, phi, gamma, gammaW = NA, alpha, D, zw, metric)
FSplanar(c, phi, alpha, L, W, u)
}
\arguments{
  \item{c}{soil cohesion}
  \item{phi}{soil friction angle (degrees)}
  \item{gamma}{soil unit weight}
  \item{gammaW}{unit weight of water (default = 62.4 pcf for English
    units; 9.81 kN/m^3 for metric units)}
  \item{alpha}{slope angle (angle of failure plane) for infinite slope
    analysis; angle of failure plane for planar failure analysis (deg)}
  \item{D}{depth to failure plane}
  \item{zw}{distance of groundwater table above failure plane
    (use 0 for a dry slope and D for a submerged slope with parallel seepage)}
  \item{metric}{logical variable: TRUE (for metric units: kN/m^3) or
    FALSE (for English units: pcf) [this is needed if gammaW is unspecified]}
  \item{L}{length of failure plane (planar failure analysis)}
  \item{W}{weight of slope per unit width (planar failure analysis)}
  \item{u}{average pressure head on the failure plane (planar failure analysis)}
}
\details{
  \itemize{
    \item{
      The assumptions of infinite slope analyses include (Coduto et al.,
      2011):
      \enumerate{
	\item{The slope face is planar and of infinite extent.}
	\item{The failure surface is parallel to the slope face.}
	\item{Vertical columns of equal dimensions through the slope are
	  identical.}
      }
    }
    \item{
      For planar failure analysis, the angle of the failure plane is
      generally not equal to the failure angle.  The geometry of the
      failure wedge is specified using its weight, W.
    }
    \item{
      Either English or metric units can be used, but must be
      consistent.
    }
  }
}
\references{
  Coduto, D.P., Yeung, M.R., and Kitch, W.A. (2011). Geotechnical
  Engineering: Principles and Practices, Second Edition. Pearson: Upper
  Saddle River, N.J.
}
\note{See a geotechnical engineering textbook such as Coduto et
  al. (2011) for more background on slope stability theory.}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
