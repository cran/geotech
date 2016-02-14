\name{USCS}
\alias{USCS}
\alias{USCS.fine.symbol}
\alias{USCS.coarse.symbol}
\title{USCS Soil Classification}
\description{This set of functions classifies soil using the
  Unified Soil Classification System (USCS).}
\usage{
USCS(pg = NA, ps = NA, pf = NA, Cc = NA, Cu = NA,
     LL = NA, PL = NA, PI = NA, sieve = NA, size = NA,
     percent = NA, metric = NA)
USCS.fine.symbol(LL, PL, PI = NA)
USCS.coarse.symbol(pg, ps, pf, Cc, Cu, PI = NA, LL, PL)
}
\arguments{
  \item{pg}{percent gravel}
  \item{ps}{percent sand}
  \item{pf}{percent fines}
  \item{Cu}{coefficient of uniformity}
  \item{Cc}{coefficient of curvature}
  \item{sieve}{vector of sieve numbers (according to ASTM D422)
    in grain-size distribution}
  \item{size}{vector of grain sizes (in or mm) in distribution}
  \item{percent}{vector of percent passing in grain-size distribution}
  \item{metric}{logical variable for grain-size distribution:
    TRUE for metric units (mm), FALSE for English units (in);
    only required if "size" is supplied}
  \item{LL}{liquid limit (percent)}
  \item{PL}{plastic limit (percent)}
  \item{PI}{plasticity index (percent)}
}
\details{
  The USCS function is the master function for performing soil
  classifications:
  \itemize{
    \item{Data on the soil's grain-size distribution are required if
      the percent fines is less than or equal to 12 percent.  The user has
      three options for input to this function:
      \enumerate{
	\item{Sieve numbers (sieve); and percent passing}
	\item{Grain sizes (size); and percent passing}
	\item{Percent components (pg, ps, pf) and coefficients of
	  uniformity and curvature (Cc and Cu)}
      }
    }
    \item{Data on the soil's fines [either (a) LL and PL or (b) LL and
      PI] are required if the percent fines is greater than or equal
      to 5 percent.}
    \item{If percent components are specified, then Cu and Cc are
      needed if pf < 85 percent.}
  }
  The USCS.fine.symbol and USCS.coarse.symbol are used to obtain the
  group symbols for fine-grained and coarse-grained soils, respectively.
  For USCS.fine.symbol, either PI or PL must be specified in addition
  to LL.  For USCS.coarse.symbol:
  \itemize{
    \item{Data on the soil's gradation (Cu and Cc) are required if the
      percent fines is less than or equal to 12 percent.}
    \item{Data on the soil's fines [either (a) LL and PL or (b) LL
      and PI] are required if the percent fines is greater than or
      equal to 5 percent.}
  }
}
\value{
  \itemize{
    \item{USCS outputs a two-element list providing a soil's
      USCS group symbol and name:
      \enumerate{
	\item{symbol = USCS group symbol}
	\item{name = USCS group name}
      }
    }
    \item{USCS.fine.symbol outputs a fine-grained soil's two-letter
      group symbol.}
    \item{USCS.coarse.sybmol outputs a coarse-grained soil's two-letter
      group symbol.}
  }
}
\references{
  ASTM (2010). "Annual Book of ASTM Standards", Volume 04.08 -- Soil and
  Rock, ASTM International, Philadelphia.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{AASHTO}}, \code{\link{grainSize}},
  \code{\link{Plasticity}}}
\examples{
## Example code for USCS
USCS(pg = 15, ps = 34, pf = 51, Cc = 1, Cu = 4, LL = 40, PL = 10)
}
