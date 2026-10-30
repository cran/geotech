#' Hydraulic Conductivity From Constant Head Test (Groundwater)
#' 
#' Computes the hydraulic conductivity from the constant head test. 1 January
#' 2016
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
#' @return Hydraulic conductivity from the constant head test
#' 
#' @param V = volume of water collected
#' @param t = time of flow
#' @param h = head difference between inflow and outflow
#' @param L = length of soil sample
#' @param As = cross-sectional area of the soil sample
#' @param Ds = diameter of soil sample
#' 
#' @examples
#' kConstant(V = 800, t = 100, h = 200, As = 40, L = 50)
#' # k in units of cm/s
#' 
#' @note
#' Either English or metric units can be used, but they must be consistent.
#' Either the area or the diameter of the soil sample need to be specified
#' @export
kConstant <- function(V, t, h, L, As = NA, Ds = NA){

  ##  Compute flow rate
  Q <- V / t

  ##  Compute hydraulic gradient
  i <- h / L

  ##  Compute cross-sectional area
  if(is.na(As) == TRUE){
    As <- pi/4 * Ds^2
  }

  ##  Compute hydraulic conductivity
  k <- Q / (i*As)

  return(k)
}







#' Hydraulic Conductivity From Falling Head Test (Groundwater)
#' 
#' Computes the hydraulic conductivity from the falling head test. 1 January
#' 2016
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
#' @return Hydraulic conductivity from the falling head test
#' 
#' @param h0 = head difference at beginning of test
#' @param hf = head difference at end of test (h0 > hf)
#' @param t = time of flow
#' @param L = length of soil sample
#' @param As = cross-sectional area of the soil sample
#' @param Ap = cross-sectional area of the standpipe
#' @param Ds = diameter of the soil sample
#' @param Dp = diameter of the standpipe
#' 
#' @examples
#' kFalling(h0 = 12, hf = 2, L = 10, Ds = 20, Dp = 2, t = 100)
#' # k in units of cm/s
#' 
#' @note
#' Either English or metric units can be used, but they must be consistent.
#' Either the areas (As and Ap) OR the diameters (Ds and Dp) need to be specified.
#' 
#' @export
kFalling <- function(h0, hf, t, L, As = NA, Ap = NA, Ds = NA, Dp = NA){

  ##  Cross-sectional areas
  if(is.na(As) == TRUE){
    As <- pi/4 * Ds^2
  }
  if(is.na(Ap) == TRUE){
    Ap <- pi/4 * Dp^2
  }

  ##  Hydraulic conductivity
  k <- ((Ap * L) / (As * t)) * log(h0 / hf)

  return(k)
}






#' Equivalent Horizontal Hydraulic Conductivity (Groundwater)
#' 
#' Computes the equivalent horizontal hydraulic conductivity. 1 January
#' 2016
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
#' @return Equivalent horizontal hydraulic conductivity (kx) for layered soil
#'     deposits
#' 
#' @param thk = vector of layer thicknesses
#' @param k = vector of layer hydraulic conductivities
#' 
#' @export
kx <- function(thk, k){

  return(sum(k * thk) / sum(thk))
  
}




#' Equivalent Vertical Hydraulic Conductivity (Groundwater)
#' 
#' Computes the equivalent vertical hydraulic conductivity. 1 January
#' 2016
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return Equivalent vertical hydraulic conductivity (kz) for layered soil
#'     deposits
#' 
#' @param thk = vector of layer thicknesses
#' @param k = vector of layer hydraulic conductivities
#' 
#' @export
kz <- function(thk, k){

  return(sum(thk) / sum(thk / k))
  
}




#' Flow Rate to Wells (Groundwater)
#' 
#' Computes the flow rate to wells. 1 January 2016
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
#' @return Q = flow rate to well
#' 
#' @param k = hydraulic conductivity of aquifer
#' @param H = thickness of aquifer
#' @param h0 = initial total head in aquifer (before pumping)
#' @param hf = final total head in well casing (after pumping)
#' @param r0 = radius of influence
#' @param rw = radius of well
#' 
#' @examples
#' wellFlow(k = 0.065, H = 10, h0 = 21, hf = 15, r0 = 20, rw = 2)
#' 
#' @note
#' Datum for h0 and hf is the bottom of the aquifer.
#' For unconfined aquifers, H > h0 (or specify as NA)
#' For confined aquifers, H >= hf.
#' For mixed aquifers (which start as confined prior to pumping and finish as
#' unconfined after pumping is complete), H < hf.
#'               
#' @export
wellFlow <- function(k, H = NA, h0, hf, r0, rw){

  ##  Unconfined aquifers
  if(is.na(H) == TRUE || H > h0){
    Q <- pi * k * (h0^2 - hf^2) / log(r0 / rw)
  } else{
    if(is.na(H) == FALSE){

      ##  Confined aquifers
      if(H <= hf){
        Q <- 2 * pi * k * H * (h0 - hf) / log(r0 / rw)
      } else{

        ##  Mixed aquifers
        if(H > hf){
          Q <- pi * k * (2*H*h0 - H^2 - hf^2) / log(r0 / rw)
        }
      }
    }
  }
  return(Q)
}






#' Well Drawdown (Groundwater)
#' 
#' Computes the well drawdown. 1 January 2016
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
#' @return A two-element list containing: h = height of groundwater surface a
#'    distance r from the well and dd = h0 - h = drawdown of groundwater
#'    surface a distance r from the well
#' 
#' 
#' @param Q = flow rate into well
#' @param k = hydraulic conductivity of aquifer
#' @param H = saturated thickness of aquifer
#' @param h0 = initial total head in aquifer (before pumping)
#' @param r0 = radius of influence
#' @param rw = radius of well
#' @param r = radius of interest
#'
#' @examples
#' wellDrawdown(Q = 14.5, k = 0.065, H = 10, h0 = 21, r0 = 20, r = 2, rw = 2)
#'
#' @note
#' Datum for total heads are the bottom of the aquifer.
#' For unconfined aquifers, H = NA.
#' For confined aquifers, H >= hf.
#' For mixed aquifers (which start as confined prior to pumping and finish as
#' unconfined after pumping is complete), H < hf.
#' @export
wellDrawdown <- function(Q, k, H = NA, h0, r0, rw, r){

  ##  Return h = h0 and dd = 0 if r > r0
  if(r >= r0){
    h <- h0
    dd <- 0
  } else{
  
    ##  Unconfined aquifers
    if(is.na(H) == TRUE || H > h0){
      h <- sqrt(h0^2 - (Q/(pi*k)) * log(r0 / r))
      dd <- h0 - h
    } else{
      if(is.na(H) == FALSE){
        
        ##  Determine drawdown at well
        hf <- sqrt(2*H*h0 - H^2 - (Q/(pi*k)) * log(r0 / rw))
        
        ##  Confined aquifers
        if(H <= hf){
          h <- h0 - (Q / (2*pi*k*H)) * log(r0 / r)
          dd <- h0 - h
        } else{
          
          ##  Mixed aquifers
          if(H > hf){
            h <- sqrt(2*H*h0 - H^2 - (Q/(pi*k)) * log(r0 / r))
            dd <- h0 - h
          }
        }
      }
    }
  }
  return(list(h = h, dd = dd))
}






#' Hydraulic Conductivity From Pumping Tests (Groundwater)
#' 
#' Computes the hydraulic conductivity from pumping tests. 1 January 2016
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
#' @return k = hydraulic conductivity of aquifer
#' 
#' @param Q = flow rate into well
#' @param H = thickness of aquifer
#' @param h1 = total head in farthest observation well
#' @param h2 = total head in nearest observation well
#' @param r1 = radius from pumped well to farthest observation well
#' @param r2 = radius from pumped well to nearest observation well
#'
#'
#' @examples
#' kPump(Q = 14.5, H = 10, h1 = 20, h2 = 16, r1 = 16, r2 = 8)
#'
#' @note
#' Datum for h0 and hf is the bottom of the aquifer.
#' For unconfined aquifers, H > h1 (or specify as NA)
#' For confined aquifers, H >= h2.
#' For mixed aquifers (which start as confined prior to pumping and finish as
#' unconfined after pumping is complete), H < h2.
#' @export
kPump <- function(Q, H = NA, h1, h2, r1, r2){

  ##  Unconfined aquifers
  if(is.na(H) == TRUE || H > h1){
    k <- Q * log(r1 / r2) / (pi * (h1^2 - h2^2))
  } else{
    if(is.na(H) == FALSE){

      ##  Confined aquifers
      if(H <= h2){
        k <- Q * log(r1 / r2) / (2 * pi * H * (h1 - h2))
      } else{
        
        ##  Mixed aquifers
        if(H > h2){
          k <- Q * log(r1 / r2) / (pi*(2*H*h1 - H^2 - h2^2))
        }
      }
    }
  }
  return(k)
}
