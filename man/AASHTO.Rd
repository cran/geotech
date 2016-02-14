\name{AASHTO}
\alias{AASHTO}
\alias{GI}
\title{AASHTO Soil Classification}
\description{This set of functions classifies soil using the American
  Association of State Highway and Transportation Officials (AASHTO)
  Soil Classification System.}
\usage{
AASHTO(sieve = NA, size = NA, percent = NA, metric = NA,
       p10 = NA, p40 = NA, p200 = NA,
       LL = NA, PL = NA, PI = NA, NP = NA)
GI(p200, LL, PL = NA, PI = NA)
}
\arguments{
  \item{sieve}{vector of sieve numbers (according to ASTM D422)
    in grain-size distribution}
  \item{size}{vector of grain sizes (in or mm) in distribution}
  \item{percent}{vector of percent passing in grain-size distribution}
  \item{metric}{logical variable for grain-size distribution:
    TRUE for metric units (mm), FALSE for English units (in);
    only required if "size" is supplied}
  \item{p10}{percent passing #10 sieve}
  \item{p40}{percent passing #40 sieve}
  \item{p200}{percent passing #200 sieve}
  \item{LL}{liquid limit (percent)}
  \item{PL}{plastic limit (percent)}
  \item{PI}{plasticity index (percent)}
  \item{NP}{logical variable indicating whether the soil
    is nonplastic (TRUE or FALSE)}
}
\details{
  In the AASHTO function:
  \itemize{
    \item{For the grain-size data, one of three following pieces of data
      must be specified:}
    \enumerate{
      \item{Sieve numbers (sieve); and percent passing}
      \item{Grain sizes (size); and percent passing}
      \item{p10, p40, p200}
    }
    \item{If sieve data are specified, for sieves larger than the no. 4
      sieve, the user should specify the sieve size in inches (e.g.,
      3/8, 3/4, 1, 1.5, 2, 3, etc.)}
    \item{If sieve or size data are specified, this function assumes
      that the no. 10, 40, and 200 sieves have been used.}
    \item{For the plasticity data, one of three following pieces of data
      must be specified:}
    \enumerate{
      \item{LL and PL}
      \item{LL and PI}
      \item{NP (if the soil is nonplastic)}
    }
    \item{This function only calculates the AASHTO group classification.
      To obtain the AASHTO group index, use the GI function.}
  }
  In the GI function, either PL or PI must be specified in addition to
  the required arguments: F and LL.
}
\value{
  \itemize{
    \item{\code{AASHTO}: AASHTO group classification}
    \item{\code{GI}: AASHTO group index (rounded to the nearest
      integer)}
  }
}
\references{
  American Association of State and Highway Transportation Officials
  [AASHTO] (1993). "Recommended Practice for the Classification
  of Soils and Soil-Aggregate Mixtures for Highway Construction
  Purposes", AASHTO Designtation 145-91, Standard Specifications
  for Transportation Materials and Methods of Sampling and Testing.

  ASTM (2010). "Annual Book of ASTM Standards", Volume 04.08 -- Soil and
  Rock, ASTM International, Philadelphia.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{USCS}}, \code{\link{grainSize}},
  \code{\link{Plasticity}}}
\examples{

## Example code for AASHTO group classification
AASHTO(p10 = 51, p40 = 30, p200 = 15, LL = 40, PI = 10)

## Example code for AASHTO group index
GI(p200 = 48, LL = 45, PI = 21)
}
