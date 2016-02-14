\name{lateralEarthPressures}
\alias{lateralEarthPressures}
\alias{K}
\alias{Ko}
\alias{Ka}
\alias{Kp}
\title{Lateral Earth Pressures}
\description{These functions are used to calculate lateral earth
  pressure coefficients using different methods.} 
\usage{
K(sigmax, sigmaz)
Ko(phi, OCR = 1)
Ka(phi, beta = 0)
Kp(phi, beta = 0)
}
\arguments{
  \item{sigmax}{horizontal effective stress}
  \item{sigmaz}{vertical effective stress}
  \item{phi}{effective friction angle (deg)}
  \item{OCR}{overconsolidation ratio; default = 1}
  \item{beta}{angle of backfill (deg); default = 0}
}
\details{
  These functions either compute the lateral earth pressure coefficient
  from provided stresses (K), common empirical correlations (Ka), or
  basic lateral earth pressure theories (Kp).
  \itemize{
    \item{
      For Ko, the Jaky (1944) equation is used for normally consolidated
      soil, and the Mayne and Kulhawy (1982) equation is used for
      overconsolidated soil.
    }
    \item{
      For Ka and Kp, the basic Rankine (1857) theory is used.  Note that
      this theory requires beta <= phi.
    }
  }
}
\value{
  \itemize{
    \item{K = Coefficient of lateral earth pressure
      (directly from provided stresses)}
    \item{Ko = Coefficient of lateral earth pressure at rest}
    \item{Ka = Coefficient of lateral earth pressure (active)}
    \item{Kp = Coefficient of lateral earth pressure (passive)}    
  }
}
\references{
  
  Jaky, J. (1944). "The Coefficient of Earth Pressure at Rest",
  Journal for the Society of Hungarian Architects and Engineers,
  October, pp. 355-358.

  Mayne, P.W., and Kulhawy, F.H. (1982). "Ko-OCR Relationships
  in Soil", Journal of the Geotechnical Engineering Division, ASCE,
  Vol. 108, No. GT6, pp. 851-872.
  
  Rankine, W.J.M. (1857). "On the Stability of Loose Earth",
  Philosophical Transactions of the Royal Society, Vol. 147, London.
  
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{stressHorizontal}}}
\examples{

##  Example code for Coefficient of lateral earth pressure
K(sigmax = 50, sigmaz = 90)

##  Example code for Coefficient of lateral earth pressure at rest
Ko(phi = 20, OCR = 1)

##  Example code for Coefficient of lateral earth pressure (active)
Ka(phi = 30, beta = 10)

##  Example code for Coefficient of lateral earth pressure (passive)
Kp(phi = 30, beta = 10)
}