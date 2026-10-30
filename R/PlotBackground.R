#' logAxis Plot Background Function
#' 
#' Plotting one axis at a time for the log-based plots. 1 December 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#' 
#' 
#'
#'
#' @encoding UTF-8
#'
#' @note
#' Contains functions that are used to create the logarithmic and
#' semilogarithmic plots that are used by other functions in the package.
#' 
#' @param data = vector of data values for plot;
#' @param type = "x" for horizontal axis; "y" for vertical axis
#' @param gridlines = vertical TRUE for vertical gridlines across plot;
#'    FALSE otherwise (default = FALSE)
#' 
#' 
#' @keywords internal
#' @export
logAxis.plot <- function(data, type, gridlines){
  
  ##  Range of data
  pow.min <- 10^floor(log10(min(data[data > 0])))
  pow.max <- 10^ceiling(log10(max(data)))
  
  ##  Tick marks
  major.ticks <- 10^seq(from = log10(pow.min), to = log10(pow.max), by = 1)
  minor.ticks <- c()
  j <- 1
  for(i in 1:(length(major.ticks)-1)){
    minor.ticks[j:(j+9)] <- seq(from = major.ticks[i], to = major.ticks[i+1],
                                by = major.ticks[i])
    j <- j + 10
  }
  labels <- formatC(major.ticks, format = "fg")

  ##  Side for axis
  if(type == "x"){
    side <- 1
  } else{
    if(type == "y"){
      side <- 2
    }
  }
  
  ##  Draw axes
  axis(side = side, at = major.ticks, labels = labels, tcl = -0.6)
  axis(side = side, at = minor.ticks, labels = FALSE, tcl = -0.3)

  ##  Draw gridlines
  if(gridlines == TRUE){
    axis(side = side, at = major.ticks, labels = FALSE, tck = 1,
         col = "gray70", lwd = 2)
    axis(side = side, at = minor.ticks, labels = FALSE, tck = 1,
         col = "gray50", lwd = 1)
  }

}




#' logAxis Background Wrapper Function for Performing Calculations
#' 
#' Performing background calculations for the log-based plots. 1 December 2015
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#' 
#' 
#'
#'
#' @encoding UTF-8
#'
#' @param x = data for x-axis
#' @param y = data for y-axis
#' @param gridX = TRUE if gridlines in the horizontal directions are to be drawn;
#'    FALSE otherwise
#' @param gridY = TRUE if gridlines in the vertical directions are to be drawn;
#'    FALSE otherwise
#' @keywords internal
#' @export
logAxis <- function(x = NA, y = NA, gridX = FALSE, gridY = FALSE){

# Due to the "Error in is.na(x) == FALSE && is.na(y) == TRUE :" error message, Irucka Embry added all() for each is.na term in the following code (revised on 23 September 2026)

  if(all(is.na(x) == FALSE) && all(is.na(y) == TRUE)){
    logAxis.plot(data = x, type = "x", gridlines = gridY)
    
  } else{
    if(all(is.na(x) == TRUE) && all(is.na(y) == FALSE)){
      logAxis.plot(data = y, type = "y", gridlines = gridX)
      
    } else{
      if(all(is.na(x) == FALSE) && all(is.na(y) == FALSE)){
        logAxis.plot(data = x, type = "x", gridlines = gridY)
        logAxis.plot(data = y, type = "y", gridlines = gridX)
      }
    }
  }
}
