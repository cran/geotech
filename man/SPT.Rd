\name{SPT}
\alias{SPT}
\alias{N60}
\alias{N160}
\title{Standard Penetration Test (SPT) Corrected N-values}
\description{These functions are used to calculate corrected blow counts
  (N-values) for the Standard Penetration Test (SPT).  Function N60
  calculates corrections for field procedures, and function
  N160 calculates corrections for field procedures and overburden
  pressure.}

\usage{
N60(N, Lr, Db, SS = TRUE, E = 0.60, metric)
N160(N60, sigma, metric)
}
\arguments{
  \item{N}{raw SPT N-value}
  \item{Lr}{rod length (ft or m)}
  \item{E}{hammer efficiency as a decimal (default: 0.60)}
  \item{Db}{borehole diameter (in or mm)}
  \item{SS}{logical variable: TRUE for standard sampler [default];
    FALSE for sampler without liner}
  \item{N60}{SPT N-value corrected for field procedures}
  \item{sigma}{effective vertical stress at the depth of interest (psf or kPa)}
  \item{metric}{logical variable: TRUE (for metric units)
    or FALSE (for English units)}
}
\value{
  \itemize{
    \item{N60 = SPT blow count (N-value) corrected for field procedures,
      after Skempton (1986)}
    \item{N1,60 = SPT blow count (N-value) corrected for field procedures
      and overburden pressure, using the Liao and Whitman (1986) stress
      correction}
  }
}
\references{
  Liao, S.S.C., and Whitman, R.V. (1986). "Overburden Correction Factors
  for SPT in Sand", Journal of Geotechnical Engineering, Vol. 112,
  No. 3, pp. 373-377, ASCE.
  
  Skempton, A.W. (1986). "Standard Penetration Test Procedures and the
  Effects in Sands of Overburden Pressure, Relative Density, Particle
  Size, Aging, and Overconsolidation", Geotechnique, Vol. 36, No. 3,
  pp. 425-447.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\examples{

##  Example code for SPT blow count (N-value) corrected for field
##  procedures
N60(N = 11, Lr = 25, Db = 4, E = 0.50, SS = TRUE, metric = FALSE)

##  Example code for SPT blow count (N-value) corrected for field
##  procedures and overburden pressure
##  In English units
N160(N60 = 8, sigma = 1500, metric = FALSE)
##  In SI units
N160(N60 = 8, sigma = 90, metric = TRUE)
}
