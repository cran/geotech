#' Gross Bearing Pressure (Bearing Capacity)
#' 
#' Calculates the footing gross bearing pressure. 1 October 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' 
#' 
#' @return Gross bearing pressure of footing (psf or kPa)
#' 
#' @param P = Vertical gross column load (lb or kN)
#' @param B = foundation width (ft or m)
#' @param L = foundation length (ft or m)
#' @param D = Depth of foundation (ft or m)
#' @param Dw = Depth of groundwater table below foundation base (ft or m)
#' @param metric = logical variable: TRUE (for metric units) or FALSE (for English units)
#' @param gammaW = unit weight of water (default = 62.4 pcf for English units; 9.81 kN/m^3 for metric units)
#' @param gammaC = unit weight of concrete (default = 150 pcf for English units; 23.6 kN/m^3 for metric units)
#' 
#' @examples
#' bearingPressure(P = 1000, B = 2, L = 5, D = 6, Dw = 2, metric = FALSE)
#' 
#' @note
#' Either SI or English units can be used, but must stay consistent.
#' When specifying the length and width, L should be the longer of the two lengths.
#' For a continuous (strip) foundation, specify L = 1 and specify P as the load per unit length
#' When the groundwater table is deep or unknown, set Dw >= D.
#' @export
bearingPressure <- function(P, B, L, D, Dw, metric, gammaW = NA, gammaC = NA){

  ##  Define gammaW and gammaC for metric units
  if(metric == TRUE){
    if(is.na(gammaW) == TRUE){
      gammaW <- 9.81
    }
    if(is.na(gammaC) == TRUE){
      gammaC <- 23.6
    }
  } else{
    ##  Define gammaW and gammaC for metric units
    if(metric == FALSE){
      if(is.na(gammaW) == TRUE){
        gammaW <- 62.4
      }
      if(is.na(gammaC) == TRUE){
        gammaC <- 150
      }
    }
  }
  

  ##  Ensure that pore water pressure is no less than zero
  u <- max(0, gammaW * (D - Dw))

  ##  Calculate bearing pressure
  q <- (P / (B*L)) + (gammaC * D) - u
  
  return(q)
}






#' Bearing Capacity Factors (Nq)
#' 
#' Calculates the bearing capacity factor Nq. 1 October 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#'
#' @references
#' Donald P. Coduto, \emph{Foundation Design: Principles and Practices}, 2nd Edition, Prentice Hall, Upper Saddle River, N.J., ISBN 9780135897065, 2001, 883 pp.
#' 
#' @return Bearing capacity factor (Nq) using either the Terzaghi
#'    or Vesic methods
#'          
#' 
#' @param phi = friction angle (degrees)
#' @param case = "general" or "local" to indicate general or local shear
#'    failure ("general" is default)
#' @param method = "Terzaghi" or "Vesic" ("Terzaghi" is default)
#' 
#' @note
#' For local shear, the friction angle is reduced to a value equal to atan(2/3
#' * tan(phi)).
#' Terzaghi's Ngamma is approximated by Coduto (2001).
#' 
#' 
#' 
#' @export
Nq <- function(phi, case = "general", method = "Terzaghi"){

##  FUNCTION FOR Nq

  ##  Input checking
  if(case != "general" && case != "local")
    stop("Case may only be 'general' or 'local'.")
  if(method != "Terzaghi" && method != "Vesic")
    stop("Case may only be 'Terzaghi' or 'Vesic'.")
  
  ##  Adjustment for local shear
  if(case == "local") phi <- atan(2/3 * tan(phi*pi/180))*180/pi

  ##  Angles
  phi.deg <- phi
  phi.rad <- phi * pi/180

  ##  Evaluate bearing capacity
  if(method == "Terzaghi"){
    num <- exp(2*pi*(3/4 - phi.deg/360)*tan(phi.rad))
    den <- 2*(cos((45 + phi.deg/2)*pi/180))^2
    Nq.value <- num/den
  } else{
    if(method == "Vesic"){
      Nq.value <- tan((45 + phi.deg/2)*pi/180)^2 * exp(pi * tan(phi.rad))
    }
  }
  return(Nq.value)
}

 

#' Bearing Capacity Factors (Nc)
#' 
#' Calculates the bearing capacity factor Nc. 1 October 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' 
#' @return Bearing capacity factor (Nc) using either the Terzaghi
#'    or Vesic methods
#'          
#' 
#' @param phi = friction angle (degrees)
#' @param case = "general" or "local" to indicate general or local shear
#'    failure ("general" is default)
#' @param method = "Terzaghi" or "Vesic" ("Terzaghi" is default)
#' 
#' @note
#' For local shear, the friction angle is reduced to a value equal to atan(2/3
#' * tan(phi)).
#' 
#' 
#' 
#' @export
Nc <- function(phi, case = "general", method = "Terzaghi"){

##  FUNCTION FOR Nc

  ##  Input checking
  if(case != "general" && case != "local")
    stop("Case may only be 'general' or 'local'.")
  if(method != "Terzaghi" && method != "Vesic")
    stop("Case may only be 'Terzaghi' or 'Vesic'.")
  
  ##  Adjustment for local shear
  if(case == "local") phi <- atan(2/3 * tan(phi*pi/180))*180/pi

  ##  Angles
  phi.deg <- phi
  phi.rad <- phi * pi/180

  ##  Evaluate bearing capacity
  if(method == "Terzaghi"){
    Nq.value <- Nq(phi = phi.deg, case = "general", method = "Terzaghi")
    if(phi.deg == 0) return(5.7)
    if(phi.deg > 0) return((Nq.value-1)/tan(phi.rad))
  } else{
    if(method == "Vesic"){
      Nq.value <- Nq(phi = phi.deg, case = "general", method = "Vesic")
      if(phi.deg == 0) return(5.14)
      if(phi.deg > 0) return((Nq.value-1)/tan(phi.rad))
    }
  }
}





#' Bearing Capacity Factors (Ngamma)
#' 
#' Calculates the bearing capacity factor Ngamma. 1 October 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' 
#' @return Bearing capacity factor (Ngamma) using either the Terzaghi
#'    or Vesic methods
#'          
#' 
#' @param phi = friction angle (degrees)
#' @param case = "general" or "local" to indicate general or local shear
#'    failure ("general" is default)
#' @param method = "Terzaghi" or "Vesic" ("Terzaghi" is default)
#' 
#' @note
#' For local shear, the friction angle is reduced to a value equal to atan(2/3
#' * tan(phi)).
#' 
#' 
#' 
#' @export
Ngamma <- function(phi, case = "general", method = "Terzaghi"){

##  FUNCTION FOR Ngamma

  ##  Input checking
  if(case != "general" && case != "local")
    stop("Case may only be 'general' or 'local'.")
  if(method != "Terzaghi" && method != "Vesic")
    stop("Case may only be 'Terzaghi' or 'Vesic'.")
  
  ##  Adjustment for local shear
  if(case == "local") phi <- atan(2/3 * tan(phi*pi/180))*180/pi

  ##  Angles
  phi.deg <- phi
  phi.rad <- phi * pi/180

  ##  Evaluate bearing capacity
  if(method == "Terzaghi"){
    Nq.value <- Nq(phi = phi.deg, case = "general", method = "Terzaghi")
    num <- 2*(Nq.value+1)*tan(phi.rad)
    den <- 1 + 0.4*sin(4*phi.rad)
    Ngamma.value <- num/den
  } else{
    if(method == "Vesic"){
      Nq.value <- Nq(phi = phi.deg, case = "general", method = "Vesic")
      Ngamma.value <- 2*(Nq.value + 1)*tan(phi.rad)
    }
  }
  return(Ngamma.value)
}




#' Ultimate Bearing Capacity (Terzaghi)
#' 
#' Calculates the ultimate bearing capacity from Terzaghi's simple theory. 1
#' October 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' 
#'
#' @return Bearing capacity (q_ult) from Terzaghi's simple theory (psf or kPa)
#'
#' @param phi = effective friction angle (deg)
#' @param c = effective cohesion (psf or kPa)
#' @param B = foundation width (ft or m), or foundation diameter for circular
#'    footings
#' @param L = foundation length (ft or m)
#' @param D = Depth of foundation (ft or m)
#' @param Dw = Depth of groundwater table below foundation base (ft or m)
#' @param gamma = unit weight of soil (pcf of kN/m^3)
#' @param gammaW = unit weight of water (default = 62.4 pcf for English units;
#'    9.81 kN/m^3 for metric units)
#' @param case = "general" or "local" to indicate general or local shear
#'    failure ("general" is default)          
#' @param shape = "square", "rectangle", "circle", "strip" (or "continuous")
#' @param metric = logical variable: TRUE (for metric units) or FALSE (for
#'    English units)
#' 
#' @note
#' Either SI or English units can be used, but must stay consistent.
#' When specifying the length and width of rectangular foundations, L should be
#' the longer of the two lengths.             
#' When the groundwater table is deep or unknown, set Dw >= D + B
#' @export
bearingCapacity <- function(phi, c, B, L, D, Dw, gamma, gammaW = NA, metric,
                            case = "general", shape = "square"){
  
  ##  Input checking
  if(case != "general" && case != "local")
    stop("Case may only be 'general' or 'local'.")
  if(shape != "rectangle" && shape != "square" && shape != "circle" &&
     shape != "strip" && shape != "continuous"){
    stop("Shape may only be 'rectangle', 'square', 'circle', or 'strip' (or 'continuous').")
  }

  ##  Define gammaW
  if(metric == TRUE){
    if(is.na(gammaW) == TRUE){
      gammaW <- 9.81
    }
  } else{
    if(metric == FALSE){
      if(is.na(gammaW) == TRUE){
        gammaW <- 62.4
      }
    }
  }
  
  ##  Correct cohesion for local shear
  if(case == "local"){
    c <- 2/3 * c
  }
  
  ##  Obtain bearing capacity factors
  Nc.value <- Nc(phi, case = case, method = "Terzaghi")
  Nq.value <- Nq(phi, case = case, method = "Terzaghi")
  Ngamma.value <- Ngamma(phi, case = case, method = "Terzaghi")

  ##  Effective stress at footing base
  sigmaD <- gamma * D -  max(0, gammaW * (D - Dw))
  
  ##  Correct unit weight for groundwater conditions
  ##  Case 1:  Groundwater table above base of footing
  if(Dw <= D){
    gamma <- gamma - gammaW
  } else{
    ##  Case 2:  Groundwater table within depth B of the footing base
    if(Dw > D && Dw < (D + B)){
      gamma <- gamma - gammaW*(1 - (Dw - D)/B)
    } else{
      ##  Case 3:  Groundwater table deeper than D + B below footing base
      if(Dw > (D + B)){
        gamma <- gamma
      }
    }
  }

  ##  Evaluate bearing capacity for different foundation shapes
  if(shape == "continuous" || shape == "strip"){
    qult <- (c * Nc.value) + (sigmaD * Nq.value) + (0.5 * gamma * B * Ngamma.value)
  } else{
    if(shape == "square"){
      qult <- (1.3 * c * Nc.value) + (sigmaD * Nq.value) + (0.4 * gamma * B * Ngamma.value)
    } else{
      if(shape == "circle"){
        qult <- (1.3 * c * Nc.value) + (sigmaD * Nq.value) + (0.3 * gamma * B * Ngamma.value)
      } else{
        if(shape == "rectangle"){
          qult <- (c * Nc.value * (1 + 0.2*(B/L))) + (sigmaD * Nq.value * (1 + 0.2*(B/L))) +
            (0.5 * gamma * B * Ngamma.value * (1 - 0.3*(B/L)))
        }
      }
    }
  }
  return(qult)
}
