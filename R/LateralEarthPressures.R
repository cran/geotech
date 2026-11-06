#' Coefficient of Lateral Earth Pressure (General)
#' 
#' Calculates the general coefficient of lateral earth pressure. 1 October 2015
#' 
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
#' @return Coefficient of lateral earth pressure
#'
#' @examples
#' K(sigmax = 50, sigmaz =90)
#' 
#' @param sigmax = Horizontal effective stress
#' @param sigmaz = Vertical effective stress
#' @export
K <- function(sigmax, sigmaz){
  return(sigmax / sigmaz)
}






#' Coefficient of Lateral Earth Pressure at Rest
#' 
#' Calculates the coefficient of lateral earth pressure at rest. 1 October 2015
#' 
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
#' \enumerate{
#'    \item J. Jaky, "The coefficient of earth pressure at rest In Hungarian (A nyugalmi nyomas tenyezoje)", \emph{J. Soc. Hung. Eng. Arch.} (\emph{Magyar Mernok es Epitesz-Egylet Kozlonye}), 1944, Pages 355-358.
#'    \item Paul W. Mayne and Fred H. Kulhawy, "K0-OCR relationship in soil", \emph{J. Geotech. Eng. Div., Am. Soc. Civ. Eng.}, 108(6), 1982, Pages 851-872.
#' }
#' 
#' 
#' @return Coefficient of lateral earth pressure at rest
#' 
#' @param phi = effective friction angle (deg)
#' @param OCR = overconsolidation ratio (default = 1)
#' 
#' @note
#' For normally consolidated soil, the Jaky (1944) equation is used;
#' for overconsolidated soil, the Mayne and Kulhawy (1982) equation is used
#' @export
Ko <- function(phi, OCR = 1){

  if(OCR == 1){
    Ko <- 1 - sin(phi * pi/180)
  } else{
    if(OCR > 1){
      Ko <- (1 - sin(phi * pi/180)) * OCR ^ sin(phi * pi/180)
    }
  }
  return(Ko)
}




#' Rankine Active Earth Pressures (Lateral Earth Pressure)
#' 
#' Calculates the active coefficient of lateral earth pressure.
#' 1 October 2015
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
#' @return Coefficient of lateral earth pressure (active)
#' 
#' @param phi = effective friction angle (deg)
#' @param beta = angle of backfill (deg); default = 0
#' 
#' @note
#' The Rankine theory requires that beta <= phi
#' 
#'
#' @examples
#' Ka(phi = 30, beta = 10)
#' 
#' 
#' 
#' @export
Ka <- function(phi, beta = 0){

##  FUNCTION FOR Ka

  ##  Check angles
  if(beta > phi){
    stop("Backfill angle can be no greater than the soil friction angle.")
  }
  
  ##  Convert angles to radians
  beta <- beta * pi/180
  phi <- phi * pi/180

  ##  Calculate Ka
  num <- cos(beta) * (cos(beta) - sqrt((cos(beta)^2 - cos(phi)^2)))
  den <- cos(beta) +  sqrt((cos(beta)^2 - cos(phi)^2))
  return(num / den)
}






#' Rankine Passive Earth Pressures (Lateral Earth Pressure)
#' 
#' Calculates the passive coefficient of lateral earth pressure. 1 October 2015
#' 
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
#' @return Coefficient of lateral earth pressure (passive)
#' 
#' @param phi = effective friction angle (deg)
#' @param beta = angle of backfill (deg); default = 0
#' 
#' @note
#' The Rankine theory requires that beta <= phi
#' 
#'
#' 
#' 
#'
#' @examples
#' Kp(phi = 30, beta = 10)
#' 
#' @export
Kp <- function(phi, beta = 0){

##  FUNCTION FOR Kp

  ##  Check angles
  if(beta > phi){
    stop("Backfill angle can be no greater than the soil friction angle.")
  }
  
  ##  Convert angles to radians
  beta <- beta * pi/180
  phi <- phi * pi/180

  ##  Calculate Ka
  num <- cos(beta) * (cos(beta) + sqrt((cos(beta)^2 - cos(phi)^2)))
  den <- cos(beta) -  sqrt((cos(beta)^2 - cos(phi)^2))
  return(num / den)
}







#' Horizontal Stress at a Point (Lateral Earth Pressure)
#' 
#' Calculates the horizontal stress at a point. 1 October 2015
#' 
#' @return A three-element list containing: sigmaX.eff = effective horizontal
#'    stress, sigmaX.total = total horizontal stress, and u = pore water pressure
#'            
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
#' @examples
#' sigmaX(gamma = c(108, 116), depth = c(15, 40), zout = 18, K = c(0.34, 0.32),
#' zw = 15, metric = FALSE, upper = TRUE)
#' 
#' @param gamma = vector of unit weights (pcf or kN/m^3)
#' @param thk = vector of layer thicknesses (ft or m)
#' @param depth = vector of layer bottom depths (ft or m)
#' @param zw = depth of groundwater table (ft or m)
#' @param zout = desired depth of output (ft or m): a single value
#' @param K = vector of lateral earth pressure coefficients
#' @param gammaW = unit weight of water (default = 62.4 pcf for English units;
#'    9.81 kN/m^3 for metric units)                                   
#' @param metric = logical variable: TRUE (for metric units) or FALSE (for
#'    English units)
#' @param upper = logical variable to specify whether the upper (TRUE) or lower
#'    (FALSE) lateral earth pressure coefficient should be used, for the special
#'    case that zout corresponds to a layer interface
#'               
#'                  
#' @export
sigmaX <- function(gamma, thk = NA, depth = NA, zw, zout, K, gammaW = NA, metric, upper = TRUE){

  ##  Obtain vertical stresses
  temp <- sigmaZ(gamma = gamma, thk = thk, depth = depth, zw = zw,
                 zout = zout, gammaW = gammaW, metric)

  ##  Depths
  if(all(is.na(depth) == TRUE)){
    depth <- cumsum(thk)
  }
  
  ##  Determine appropriate lateral earth pressure coefficient index
  if(zout == 0){
    i <- 1
  } else{
    if(zout == max(depth)){
      i <- length(depth)
    } else{
      i <- min(which(zout < depth))
      if(zout == depth[i-1]){
        if(upper == TRUE){
          i <- i - 1
        }
      }
    }
  }
  ##  Calculate horizontal stresses
  u <- temp$u
  sigmaX.eff <- temp$sigmaZ.eff * K[i]
  sigmaX.total <- sigmaX.eff + u
  return(list(sigmaX.eff = sigmaX.eff, sigmaX.total = sigmaX.total, u = u))  
}







#' Horizontal Stress Profile (Lateral Earth Pressure)
#' 
#' Calculates the horizontal stress profile. 1 October 2015
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
#' @return A four-element list containing four vectors: depth = depth,
#'    sigmaZ.eff = effective vertical stress, sigmaZ.total = total vertical
#'    stress, and u = pore water pressure
#'            
#'            
#'            
#'            
#' 
#' @examples
#' sigmaX.profile(gamma = c(108, 116), depth = c(15, 40), K = c(0.34, 0.32),
#' zw = 15, metric = FALSE)
#' 
#' 
#' @param gamma = vector of unit weights (pcf or kN/m^3)
#' @param thk = vector of layer thicknesses (ft or m)
#' @param depth = vector of layer bottom depths (ft or m)
#' @param K = vector of layers' lateral earth pressure coefficients
#' @param zw = depth of groundwater table (ft or m)
#' @param zout = desired depths of output (ft or m): defaults to critical
#'    locations in the profile (the top and bottom of the profile, layer
#'    interfaces, and the groundwater table) [recommended]
#' @param gammaW = unit weight of water (default = 62.4 pcf for English units;
#'    9.81 kN/m^3 for metric units)
#' @param metric = logical variable: TRUE (for metric units) or FALSE (for
#'    English units)
#' @export
sigmaX.profile <- function(gamma, thk = NA, depth = NA, K, zw, zout = NA, gammaW = NA, metric){
  
  ##  Determine critical depths
  if(all(is.na(depth) == TRUE)){
    depth <- cumsum(thk)
  }
  
  ##  Adjust for case of different lateral earth pressure coefficients at layer interfaces
  depth.rev <- vector()
  k <- 1
  for(i in 2:length(depth)){
    if(K[i] != K[i - 1]){
      depth.rev[k] <- depth[i-1]
      k <- k + 1
    }
  }
        
  ##  Define zout
  if(all(is.na(zout) == TRUE)){
    zout <- sort(unique(c(0, depth, zw)))
    zout <- sort(c(zout, depth.rev))
  }
  
  ##  Calculate stresses
  sigmaX.eff <- vector(length = length(zout))
  sigmaX.total <- vector(length = length(zout))
  u <- vector(length = length(zout))
  for(i in 1:length(zout)){
    upper <- TRUE
    if(i >= 2){
      if(zout[i] == zout[i-1]){
        upper <- FALSE
      }
    }
    temp <- sigmaX(gamma = gamma, thk = thk, depth = depth, zw = zw, zout = zout[i],
                   K = K, gammaW = gammaW, metric = metric, upper = upper)
    sigmaX.eff[i] <- temp$sigmaX.eff
    sigmaX.total[i] <- temp$sigmaX.total
    u[i] <- temp$u
  }
  
  return(list(depth = zout, sigmaX.eff = sigmaX.eff, sigmaX.total = sigmaX.total, u = u))
}






#' Horizontal Stress Plot (Lateral Earth Pressure)
#' 
#' Draws the horizontal stress plot. 1 October 2015
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
#' @return Plot of horizontal stress profile versus depth
#' 
#' @param depth = vector of depths (ft or m)
#' @param sigmaX.eff = vector of effective stresses (psf or kPa)
#' @param sigmaX.total = vector of total stresses (psf or kPa)
#' @param u = vector of pore water pressures (psf or kPa)
#' @param metric = logical variable: TRUE (for metric units) or FALSE (for
#'    English units)
#' 
#' @examples
#' # Site with constant unit weight = 100 pcf, GWT at 10 ft depth
#' temp <- sigmaX.profile(gamma = rep(100, 3), depth = c(10, 20, 30), K =
#' c(0.35, 0.30, 0.28), zw = 10, metric = FALSE)                    
#' depth <- temp$depth
#' sigmaTotal <- temp$sigmaX.total
#' u <- temp$u
#' sigmaEff <- temp$sigmaX.eff
#' sigmaX.plot(depth = depth, sigmaX.eff = sigmaEff, metric = FALSE,
#' sigmaX.total = sigmaTotal, u = u)
#' 
#' @note
#' If sigmaX.total and u are left blank, the plot is only constructed for
#' effective stress
#' Once constructed, additional profiles may be added to this plot (for
#' example, for induced stress or maximum past pressure)
#' @export
sigmaX.plot <- function(depth, sigmaX.eff, sigmaX.total = NA, u = NA, metric){
  
  ##  Expression for axes
  if(metric == TRUE){
    xLab <- "Stress (kPa)"
    yLab <- "Depth, z (m)"
  } else{
    if(metric == FALSE){
      xLab <- "Stress (psf)"
      yLab <- "Depth, z (ft)"
    }
  }

  ##  X axis limit
  if(all(is.na(sigmaX.total)) == FALSE){
    xMax <- max(sigmaX.total)
  } else{
    xMax <- max(sigmaX.eff)
  }
  
  ##  Plot
  oldpar <- par(no.readonly = TRUE) # code line i
  on.exit(par(oldpar)) # code line i + 1
  par(mgp = c(2.8, 1, 0), las = 1)
  plot(sigmaX.eff, depth, type = "l", yaxs = "i", xaxt = "n", col = "black", lwd = 2,
       xlim = c(0, xMax), ylim = c(max(depth), 0),
       xlab = "", ylab = yLab)
  axis(3)
  mtext(xLab, side = 3, line = 2.5)
  if(all(is.na(sigmaX.total)) == FALSE && all(is.na(u)) == FALSE){
    lines(u, depth, col = "blue", lwd = 1)
    lines(sigmaX.total, depth, col = "gray70", lty = 1, lwd = 3)
    lines(sigmaX.eff, depth, col = "black", lwd = 2)
  }
 
  ##  Line for gwt
  if(all(is.na(u)) == FALSE){
    Zgwt <- depth[max(which(u == 0))]
    abline(h = Zgwt, lwd = 1, lty = 3)
    points(x = 0.95*xMax, y = Zgwt*0.97, pch = 6, cex = 1.1)
  }
    
           
  ## Legend
  if(all(is.na(sigmaX.total)) == FALSE && all(is.na(u)) == FALSE){
    legend(x = "topright", bty = "n", lty = c(1, 1, 1), lwd = c(3, 2, 1),
           col = c("gray70", "black", "blue"),
           legend = c("Total horizontal stress", "Effective horizontal stress",
             "Pore water pressure"))
  } else{
    legend(x = "topright", bty = "n", lty = c(1), lwd = c(3),
           col = c("black"), legend = c("Effective horizontal stress"))
  }
}
