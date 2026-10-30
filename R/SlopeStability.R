#' Slope Stability (Infinite Slope Analysis)
#' 
#' Determines the slope stability using the infinite slope analysis. 1 January
#' 2016
#' 
#' @author Jim Kaklamanos and Kyle Elmy
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return Factor of safety against shear failure on slopes using infinite
#'     slope analyses
#' 
#' @param c = soil cohesion [Soil parameter]
#' @param phi = soil friction angle (degrees) [Soil parameter]
#' @param gamma = soil unit weight [Soil parameter]
#' @param gammaW = unit weight of water (default = 62.4 pcf for English units;
#'     9.81 kN/m^3 for metric units) [Soil parameter]         
#' @param alpha = slope angle (degrees) [Slope geometry]
#' @param D = depth to failure plane [Slope geometry]
#' @param zw = distance of groundwater table above failure plane
#'     (use 0 for a dry slope and D for a submerged slope with parallel seepage)
#'     [Slope geometry]
#' @param metric = logical variable: TRUE (for metric units: kN/m^3) or FALSE
#'     (for English units: pcf) [this is needed if gammaW is unspecified] [Units]
#' @note
#' Assumptions of infinite slope analyses include (Coduto et al., 2011):
#' 1. The slope face is planar and of infinite extent.
#' 2. The failure surface is parallel to the slope face.
#' 3. Vertical columns of equal dimensions through the slope are identical.
#' @export
FSinf <- function(c, phi, gamma, gammaW = NA, alpha, D, zw, metric){

  
  ##  Define gammaW (if unspecified)
  if(is.na(gammaW) == TRUE){
    if(metric == TRUE){
      gammaW <- 9.81
    } else{
      if(metric == FALSE){
        gammaW <- 62.4
      }
    }
  }

  ##  Convert angles to radians
  alpha <- alpha * pi/180
  phi <- phi * pi/180

  ##  Numerator
  num <- c + (gamma*D - gammaW*zw) * (cos(alpha)^2) * tan(phi)

  ##  Demonimator
  den <- gamma * D * sin(alpha) * cos(alpha)

  ##  Factor of safety
  FS <- num / den
  
  return(FS)
}




#' Slope Stability (Planar Failure Analysis)
#' 
#' Determines the slope stability using the planar failure
#' analysis. 1 January 2016
#' 
#' @author Jim Kaklamanos and Kyle Elmy
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' @return Factor of safety against shear failure on slopes with a planar
#'     failure surface
#' @param c = soil cohesion [Soil parameters]
#' @param phi = soil friction angle [Soil parameters]
#' @param alpha = angle of failure plane (degrees) [Slope geometry]
#' @param L = length of failure plane [Slope geometry]
#' @param W = weight of slope per unit width [Slope geometry]
#' @param u = average pressure head on the failure plane [Slope geometry]
#' @note
#' Either English or metric units can be used, but they must be consistent.
#' @export
FSplanar <- function(c, phi, alpha, L, W, u){

  ##  Convert angles to radians
  alpha <- alpha * pi/180
  phi <- phi * pi/180

  ##  Numerator
  num <- c*L + (W*cos(alpha) - u*L) * tan(phi)

  ##  Demonimator
  den <- W * sin(alpha)

  ##  Factor of safety
  FS <- num / den
  
  return(FS)
}
