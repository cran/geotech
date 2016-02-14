\name{stressPlot}
\alias{stressPlot}
\alias{sigmaX.plot}
\alias{sigmaZ.plot}
\title{Plot of Stress Profile}
\description{These functions produce plots of vertical stresses versus
  depth (plot.sigmaZ) or horizontal stresses versus depth (plot.sigmaX).}
\usage{
sigmaX.plot(depth, sigmaX.eff, sigmaX.total = NA, u = NA, metric)
sigmaZ.plot(depth, sigmaZ.eff, sigmaZ.total = NA, u = NA, metric)
}
\arguments{
  \item{depth}{vector of depths (ft or m)}
  \item{sigmaX.eff}{vector of effective horizontal stresses (psf or kPa)}
  \item{sigmaX.total}{vector of total horizontal stresses (psf or kPa)}
  \item{sigmaZ.eff}{vector of effective vertical stresses (psf or kPa)}
  \item{sigmaZ.total}{vector of total vertical stresses (psf or kPa)}  
  \item{u}{vector of effective vertical stresses (psf or kPa)}
  \item{metric}{logical variable: TRUE (for metric units) or FALSE
    (for English units)vector of total vertical stresses (psf or kPa)}  
}

\details{
  \itemize{
    \item{Arguments sigmaX.eff and sigmaX.total are used in conjunction
      with sigmaX.plot, and arguments sigmaZ.eff and sigmaZ.total are
      used in conjunction with sigmaZ.plot.}
    \item{If total stresses and pore water pressure are left blank,
      the plot is only constructed for effective stress.}
    \item{Once constructed, additional profiles may be added by the user
      to this plot (for example, for induced stress or maximum past
      pressure).}
  }
}
\value{
  This function creates a plot of stresses; no numerical output
  is obtained.  To perform numerical stress calculations, see
  \code{\link{stressHorizontal}} or \code{\link{stressVertical}}.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\seealso{\code{\link{stressHorizontal}}, \code{\link{stressVertical}}}
\examples{

##  Example code for vertical stress plot
temp <- sigmaZ.profile(gamma = rep(100, 3), depth = c(10, 20, 30),
                       zw = 10, metric = FALSE)
depth <- temp$depth
sigmaTotal <- temp$sigmaZ.total
u <- temp$u
sigmaEff <- temp$sigmaZ.eff
sigmaZ.plot(depth = depth, sigmaZ.eff = sigmaEff, metric = FALSE,
            sigmaZ.total = sigmaTotal, u = u)

##  Example code for horizontal stress plot
##  Site with constant unit weight = 100 pcf, GWT at 10 ft depth
temp <- sigmaX.profile(gamma = rep(100, 3), depth = c(10, 20, 30),
                       K = c(0.35, 0.30, 0.28), zw = 10, metric = FALSE)
depth <- temp$depth
sigmaTotal <- temp$sigmaX.total
u <- temp$u
sigmaEff <- temp$sigmaX.eff
sigmaX.plot(depth = depth, sigmaX.eff = sigmaEff, metric = FALSE,
            sigmaX.total = sigmaTotal, u = u)
}
