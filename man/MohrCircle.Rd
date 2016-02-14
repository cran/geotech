\name{MohrCircle}
\alias{MohrCircle}
\alias{sigmaTrans}
\alias{MohrCircle.calc}
\alias{MohrCircle.plot}
\alias{sigma13}
\alias{tauMax}
\title{Mohr Circle Calculations}
\description{These functions are used to calculate the different
  parameters associated with Mohr Circle:
  \itemize{
    \item{\code{sigmaTrans} performs stress-transformation calculations
      at a specific angle of inclination}
    \item{\code{MohrCircle.calc} performs calculations associated with the
      Mohr Circle (stress transformation over a range of angles)}
    \item{\code{MohrCircle.plot} creates a plot of the Mohr Circle for
      a given state of stress}
    \item{\code{sigma13} calculates the magnitudes and orientations of
      the principal stresses}
    \item{\code{tauMax} calculates the magnitude and orientation of the
      maximum in-plane shear stress}
  }
}
\usage{
sigmaTrans(theta, sigmaX = NA, sigmaZ = NA, tauXZ = NA,
           sigma1 = NA, sigma3 = NA)
MohrCircle.calc(sigmaX = NA, sigmaZ = NA, tauXZ = NA,
                sigma1 = NA, sigma3 = NA,
                theta = seq(from = 0, to = 180, by = 1))
MohrCircle.plot(sigmaX = NA, sigmaZ = NA, tauXZ = NA,
                sigma1 = NA, sigma3 = NA, metric = TRUE)
sigma13(sigmaX, sigmaZ, tauXZ)
tauMax(sigmaX, sigmaZ, tauXZ)
}
\arguments{
  \item{sigmaX}{normal stress acting in the horizontal direction}
  \item{sigmaZ}{normal stress acting in the vertical direction}
  \item{tauXZ}{shear stress acting on the same plane as sigmaX}
  \item{sigma1}{major principal stress}
  \item{sigma3}{minor principal stress}
  \item{theta}{angle of inclination (degrees) [see details below]}
  \item{metric}{units, if TRUE units are SI, if FALSE units are English}  
}
\details{
  \itemize{
    \item{For sigmaTrans, MohrCircle.calc, and MohrCircle.plot, 
      One of the following two sets of data must be entered:
      \enumerate{
	\item{sigmaX, sigmaZ, and tauXZ}
	\item{sigma1 and sigma3}
      }
    }
    \item{In functions sigmaTrans and MohrCircle.calc, if theta is
      entered in conjunction with sigmaX, sigmaZ, and
      tauXZ, it is interpreted as the angle of inclination above the
      horizontal.  If theta is entered in conjunction with the principal
      stresses, then it is interpreted as the angle of inclination above
      the major principal plane.}
    \item{Note that theta is required for sigmaTrans, optional for
      MohrCircle.calc, and not used in MohrCircle.plot, sigma13, and
      tauMax.}
  }
}
\value{
  \itemize{
    \item{\code{sigmaTrans} outputs a two-element list containing
      the results of the stress-transformation calculations:
      \enumerate{
	\item{sigma = normal stress on an inclined plane}
	\item{tau = shear stress on an inclined plane}
      }
    }
    \item{\code{MohrCircle.calc} outputs a five-element list
      containing Mohr Circle calculations:
      \enumerate{
	\item{C = center of Mohr circle}
	\item{R = radius of Mohr circle}
	\item{sigma = vector of normal stresses for Mohr circle}
	\item{tau = vector of shear stresses for Mohr circle}
	\item{theta = vector of angles (deg)}
      }
    }
    \item{\code{MohrCircle.plot} produces a plot of Mohr Circle;
      no numerical calculations are output from the function.}
    \item{\code{sigma13} outputs a four-element list containing
      the magnitudes and directions of the principal stresses:
      \enumerate{
	\item{sigma1 = magnitude of major principal stress}
	\item{sigma3 = magnitude of minor principal stress}
	\item{theta1 = direction of major principal stress (deg)}
	\item{theta3 = direction of minor principal stress (deg)}
      }
    }
    \item{\code{tauMax} outputs a two-element list containing
      the magnitude and direction of the maximum in-plane
      shear stress:
      \enumerate{
	\item{tauMax = maximum in-plane shear stress}
	\item{theta = angle of maximum in-plane shear stress}
      }
    }
  }
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\examples{

##  Example code for Stress Transformation
sigmaTrans(sigmaX = 80, sigmaZ = 120, tauXZ = 20, theta = 78)

##  Example code for Mohr Circle Calculations
MohrCircle.calc(theta = 20, sigmaX = 80, sigmaZ = 120, tauXZ = 20)

##  Example code for Mohr Circle Plot
MohrCircle.plot(sigmaX = 80, sigmaZ = 120, tauXZ = 20, metric = FALSE)

##  Example code for Principal Stresses
sigma13(sigmaX = 80, sigmaZ = 120, tauXZ = 20)

##  Example code for Maximum In-Plane Shear Stress
tauMax(sigmaX = 80, sigmaZ = 120, tauXZ = 20)
}
