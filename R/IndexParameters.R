#' Phase Diagrams Plot (Phase Diagrams and Index Parameters)
#' 
#' Plots phase diagrams from weights (or masses) and volumes of a
#' soil sample. 1 December 2015
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
#' @return Plot of phase diagram
#' 
#' @param Ws = weight of solids
#' @param Ww = weight of water
#' @param Vs = volume of solids
#' @param Vw = volume of water
#' @param Va = volume of air
#' @param W.unit = measurement unit of weights
#' @param V.unit = measurement unit of volumes
#' @param mass = logical variable: TRUE for masses or FALSE for weights (default)
#'
#' @examples
#' phase.plot(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25, Va = 0.1, W.unit =
#' "lb", V.unit = "ft^3", mass = FALSE)
#'
#' @note
#' If any parameters are zero, please enter "0"; do not leave them blank.
#' Plot is currently not to scale; may be edited in the future to allow this
#' functionality.
#' @export
phase.plot <- function(Ws, Ww, Vs, Vw, Va, W.unit, V.unit, mass = FALSE){

  ##  Reference values
  x <- 0
  y <- 0

  ##  Total weights
  Wt <- Ws + Ww
  Vt <- Vs + Vw + Va
  Vv <- Vw + Va
  
  ##  Start plot
  oldpar <- par(no.readonly = TRUE) # code line i
  on.exit(par(oldpar)) # code line i + 1
  par(mgp = c(2.8, 1, 0), las = 1)
  plot(x, y, type="l", yaxs = "i", xaxs = "i", xaxt="n", yaxt="n", col = "black",
       lwd = FALSE, xlab = "", ylab = "", xlim = c(0,80), ylim = c(0,90), bty = "n",
       main = "Phase Diagram", sub = "Note: Sketch is not to scale.")
  
  ##  Arrows for weight side
  arrows(x0 = 15, y0 = 10, x1 = 15, y1 = 30, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 15, y0 = 30, x1 = 15, y1 = 50, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 7, y0 = 10, x1 = 7, y1 = 70, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)

  ##  Arrows for volume side
  arrows(x0 = 45, y0 = 50, x1 = 45, y1 = 70, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 45, y0 = 30, x1 = 45, y1 = 50, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 45, y0 = 10, x1 = 45, y1 = 30, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 60, y0 = 30, x1 = 60, y1 = 70, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)
  arrows(x0 = 70, y0 = 10, x1 = 70, y1 = 70, length = 0.1, angle = 30, code = 3,
         col = par("fg"), lty = NULL, xpd = FALSE)

  ##  Text along sides
  text(x = 12, y = 19, labels = bquote(W[s] == .(round(Ws, 3))), srt = 90, col = "black")
  text(x = 12, y = 39, labels = bquote(W[w] == .(round(Ww, 3))), srt = 90, col = "black")
  text(x = 5, y = 40, labels = bquote(W[t] == .(round(Wt, 3))), srt = 90, col = "black")
  text(x = 48, y = 19, labels = bquote(V[s] == .(round(Vs, 3))), srt = 90, col = "black")
  text(x = 48, y = 39, labels = bquote(V[w] == .(round(Vw, 3))), srt = 90, col = "black")
  text(x = 48, y = 59, labels = bquote(V[a] == .(round(Va, 3))), srt = 90, col = "black")
  text(x = 62, y = 45, labels = bquote(V[v] == .(round(Vv, 3))), srt = 90, col = "black")
  text(x = 72, y = 40, labels = bquote(V[t] == .(round(Vt, 3))), srt = 90, col = "black")
  text(x = 30, y = 20, labels = "SOLIDS", col= "brown")
  text(x = 30, y = 40, labels = "WATER", col = "blue")
  text(x = 30, y = 60, labels = "AIR", col = "grey20")
  
  ##  Text above each side
  if(mass == TRUE){
    text(x = 10, y = 80, labels = paste("Masses (", W.unit, ")", sep = ""))
  } else{
    if(mass == FALSE){
      text(x = 10, y = 80, labels = paste("Weights (", W.unit, ")", sep = ""))
    }
  }
  text(x = 60, y = 80, labels = paste("Volumes (", V.unit, ")", sep = ""))

  ##  Line for Limits
  abline(h = segments(x0 = 20, x1 = 20, y0 = 10, y1 = 70))
  abline(h = segments(x0 = 40, x1 = 40, y0 = 10, y1 = 70))
  abline(h = segments(x0 = 20, x1 = 40, y0 = 70, y1 = 70))
  abline(h = segments(x0 = 20, x1 = 40, y0 = 10, y1 = 10))
  abline(h = segments(x0 = 20, x1 = 40, y0 = 30, y1 = 30))
  abline(h = segments(x0 = 20, x1 = 40, y0 = 50, y1 = 50))
  abline(h = segments(x0 = 5, x1 = 15, y0 = 78, y1 = 78))
  abline(h = segments(x0 = 55, x1 = 65, y0 = 78, y1 = 78))
  
}





#' Weight-Volume Parameters (Phase Diagrams and Index Parameters)
#' 
#' Calculates a comprehensive list of index parameters from provided weights
#' and volumes of a soil sample. 1 December 2015
#'                
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
#' @return The output is a ten-element list containing: w = water content (as
#'    decimal), S = degree of saturation (as decimal), e = void ratio (as
#'    decimal), n = porosity (as decimal), Gs = specific gravity, gammaT = total
#'    unit weight, gammaD = dry unit weight, gammaS = unit weight of solids,
#'    gammaW = unit weight of water, and gammaB = buoyant unit weight
#'
#' @param Ws = weight of solids
#' @param Ww = weight of water
#' @param Vs = volume of solids
#' @param Vw = volume of water
#' @param Va = volume of air
#' @examples
#' phase.params(Ws = 75.8, Ww = 15.6, Vs = 0.45, Vw = 0.25, Va = 0.1)
#' @export
phase.params <- function(Ws, Ww, Vs, Vw, Va){

  ##  Total weights and volumes
  Wt <- Ws + Ww
  Vt <- Vs + Vw + Va
  Vv <- Vw + Va

  ##  Water content
  w <- Ww / Ws

  ##  Degree of saturation
  S <- Vw / Vv

  ##  Void ratio
  e <- Vv / Vs

  ##  Porosity
  n <- Vv / Vt

  ##  Total unit weight
  gammaT <- Wt / Vt

  ##  Dry unit weight
  gammaD <- Ws / Vt

  ##  Unit weight of solids
  gammaS <- Ws / Vs

  ##  Unit weight of water
  gammaW <- Ww / Vw
  
  ##  Specific gravity
  Gs <- Ws / (Vs * gammaW)

  ##  Buoyant unit weight
  gammaB <- gammaT - gammaW

  ##  Return
  return(list(w = w, S = S, e = e, n = n, Gs = Gs, gammaT = gammaT,
              gammaD = gammaD, gammaS = gammaS, gammaW = gammaW, gammaB = gammaB))
}





#' Water Content (Phase Diagrams and Index Parameters)
#' 
#' Calculates water content from lab results (i.e., measured weights or masses)
#' . 1 December 2015
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
#' 
#' @return Water content as a decimal
#' 
#' @param M1 = Mass (or weight) of can and wet soil, before oven dry
#' @param M2 = Mass (or weight) of can and dry soil, after drying in oven
#' @param Mc = Mass (or weight) of can
#' 
#' @examples
#' waterContent(M1 = 20.68, M2 = 18.14, Mc = 8.20)
#' 
#' @note
#' Either mass or weight can be used, since the units cancel.
#' @export
waterContent <- function(M1, M2, Mc){

  ##  Mass of water
  Mw <- M1 - M2
  
  ##  Mass of dry soil
  Ms <- M2 - Mc

  ##  Water content
  w <- Mw / Ms

  return(w)
}






#' Relative Density (Phase Diagrams and Index Parameters)
#' 
#' Calculates the relative density. 1 December 2015
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
#' @return Relative density as a decimal
#' 
#' @param e = void ratio
#' @param emax = maximum void ratio
#' @param emin = minimum void ratio
#' @examples
#' relDensity(e = 0.3, emax = 0.92, emin = 0.35)
#' @export
relDensity <- function(e, emax, emin){

  ## Numerator
  N <- emax - e

  ## Denominator
  D <- emax - emin

  ## Relative density
  Dr <- N / D

  return(Dr)
}
