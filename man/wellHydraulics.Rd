\name{wellHydraulics}
\alias{wellHydraulics}
\alias{wellFlow}
\alias{wellDrawdown}
\alias{kPump}
\title{Well Hydraulics}
\description{These functions are used to calculate flow rate to wells
  (\code{wellFlow}), drawdown to wells (\code{wellDrawdown}), and
  hydraulic conductivity from pumping tests (\code{kPump}).}
\usage{
wellFlow(k, H = NA, h0, hf, r0, rw)
wellDrawdown(Q, k, H = NA, h0, r0, rw, r)
kPump(Q, H = NA, h1, h2, r1, r2)
}
\arguments{
  \item{Q}{flow rate into well}
  \item{k}{hydraulic conductivity of aquifer}
  \item{H}{thickness of aquifer}
  \item{h0}{initial total head in aquifer (before pumping)}
  \item{hf}{final total head in well casing (after pumping)}
  \item{r0}{radius of influence}
  \item{rw}{radius of well}
  \item{r}{radius of interest (for drawdown calculations)}
  \item{h1}{total head in farthest observation well (kPump}
  \item{h2}{total head in nearest observation well (kPump)}
  \item{r1}{radius from pumped well to farthest observation well
    (kPump)}
  \item{r2}{radius from pumped well to nearest observation well
    (kPump)}
}
\details{
  \itemize{
    \item{Datum for total heads is the bottom of the aquifer.}
    \item{Note the following classifications of aquifers as
      unconfined, confined, or mixed (which start as confined
      prior to pumping and finish as unconfined after pumping
      is complete):}
    \itemize{
      \item{For unconfined aquifers, H > h0 (or specify as NA) in
	wellFlow and wellDrawdown, and H > h1 (or specify as NA)
	in kPump.}
      \item{For confined aquifers, H >= hf in wellFlow and wellDrawdown,
	and H >= h2 in kPump.}
      \item{For mixed aquifers, H < hf in wellFlow and wellDrawdown,
	and H >= hf in kPump.}
    }
  }
}
\value{
  \itemize{
    \item{\code{wellFlow} outputs the flow rate to the well (Q)}
    \item{\code{wellDrawdown} outputs a two-element list containing:
      \enumerate{
	\item{h = height of groundwater surface a distance r from the
	  well}
	\item{dd = h0 - h = drawdown of groundwater surface a distance
	  r from the well}
      }
    }
    \item{\code{kPump} outputs the estimated hydraulic conductivity
      of the aquifer from the pumping test}
  }
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{hydraulicConductivity}}}
\examples{
##  Example code for Flow rate to well
wellFlow(k = 0.065, H = 10, h0 = 21, hf = 15, r0 = 20, rw = 2)

##  Example code for Well Drawdown
wellDrawdown(Q = 14.5, k = 0.065, H = 10, h0 = 21, r0 = 20, r = 2,
             rw = 2)

##  Example code for Hydraulic Conductivity from pumping tests
kPump(Q = 14.5, H = 10, h1 = 20, h2 = 16, r1 = 16, r2 = 8)
}
