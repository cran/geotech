\name{soilProfile}
\alias{soilProfile}
\alias{soil.profile}
\title{Plot of Soil Profile}
\description{This function creates a plot of a soil profile.}
\usage{soil.profile(thk = NA, depth = NA, zw, type = NA, gamma = NA,
                    phi = NA, C = NA, title = "Soil Profile", metric)}
\arguments{
  \item{thk}{vector of layer thicknesses (ft or m)}
  \item{depth}{vector of layer bottom depths (ft or m)}
  \item{zw}{depth of groundwater table (ft or m)}
  \item{type}{vector of soil types (character strings)}
  \item{gamma}{vector of unit weights (pcf or kN/m^3)}
  \item{phi}{vector of soil friction angles (deg)}
  \item{C}{vector of soil cohesion (psf or kPa)}
  \item{title}{desired title of plot (deafult: "Soil Profile")}
  \item{metric}{logical variable: TRUE (for metric units)
    or FALSE (for English units)}
}
\details{
  \itemize{
    \item{Either layer thicknesses or depth to layer bottoms
      must be specified.}
    \item{The only necessary variables are thk (or depth), zw, and
      metric.  All other variables are optional.}
  }
}
\value{
  This function creates a plot of a soil profile;
  no numerical values are returned.
}
\author{James Kaklamanos <kaklamanosj@merrimack.edu> and
  Kyle Elmy <ElmyK@merrimack.edu>}
\examples{
##  Example code for plot of a soil profile
soil.profile(depth = c(20, 40, 52, 60), zw = 20, type = c("Dry Sand",
             "Saturated Sand", "Soft Clay", "Dense Gravel"),
             gamma = c(110, 115, 120, 150), phi = c(30, 30, NA, 38),
             C = c(NA, NA, 300, NA), metric = FALSE)
}