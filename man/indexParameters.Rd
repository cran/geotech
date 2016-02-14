\name{indexParameters}
\alias{indexParameters}
\alias{phase.plot}
\alias{phase.params}
\alias{waterContent}
\alias{relDensity}
\title{Phase Diagrams and Index Parameters}
\description{These functions compute and plot phase diagrams and
  index parameters associated with a soil's composition.}
\usage{
phase.plot(Ws, Ww, Vs, Vw, Va, W.unit, V.unit, mass = FALSE)
phase.params(Ws, Ww, Vs, Vw, Va)
waterContent(M1, M2, Mc)
relDensity(e, emax, emin)
}
\arguments{
  \item{Ws}{Weight of solids}
  \item{Ww}{Weight of water}
  \item{Vs}{Volume of solids}
  \item{Vw}{Volume of water}
  \item{Va}{Volume of air}
  \item{W.unit}{Measurement unit of weights}
  \item{V.unit}{Measurement unit of volume}
  \item{mass}{logical variable: TRUE for masses or FALSE for weights
    (default)}
  \item{M1}{Mass (or weight) of can and wet soil, before drying in oven}
  \item{M2}{Mass (or weight) of can and dry soil, after drying in oven}
  \item{Mc}{Mass (or weight) of can}
  \item{e}{Void ratio}
  \item{emax}{Maximum void ratio}
  \item{emin}{Minimum void ratio}
}
\details{
  \itemize{
    \item{In phase.plot, if any parameters are zero, please enter "0";
      do not leave them blank.}
    \item{In waterContent, either masses or weights may be used,
      because the units cancel.}
  }
}
\value{
  \itemize{
    \item{\code{phase.plot} plots phase diagrams from weights (or
      masses) and volumes of a soil sample.  No numerical output
      is provided.}
    \item{\code{phase.params} calculates a ten-element list
      of index parameters from provided weights and volumes
      of a soil sample:
      \enumerate{
	\item{w = water content (as decimal)}
	\item{S = degree of saturation (as decimal)}
	\item{e = void ratio (as decimal)}
	\item{n = porosity (as decimal)}
	\item{Gs = specific gravity}
	\item{gammaT = total unit weight}
	\item{gammaD = dry unit weight}
	\item{gammaS = unit weight of solids}
	\item{gammaW = unit weight of water}
	\item{gammaB = buoyant unit weight}
      }
    }
    \item{\code{waterContent} calculates the water content
      (as a decimal) from lab results (i.e., measured weights
      or masses)}
    \item{\code{relDensity} calculates the relative density (as a
      decimal) from specified void ratios (e, emax, and emin).}
  }
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\note{
  The phase diagram in phase.plot is currently not to scale; this may
  be edited in the future to allow this functionality.
}
\examples{

##  Example of phase diagram plot:
phase.plot(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25,
           Va = 0.1, W.unit = "lb", V.unit = "ft^3", mass = FALSE)

##  Example of index parameters function:
phase.params(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25, Va = 0.1)

##  Example of water content function:
waterContent(M1 = 20.68, M2 = 18.14, Mc = 8.20)

##  Example of relative density function:
relDensity(e = 0.3, emax = 0.92, emin = 0.35)

}
