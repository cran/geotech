#' Grain Sizes Of Sieves
#' 
#' Calculate a set of grain sizes corresponding to a set of sieves. 1 December
#' 2015
#' 
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return Vector of grain sizes (in or mm)
#' 
#' @param sieve = vector of sieve numbers according to ASTM D422
#' @param metric = logical variable: TRUE for metric units (mm), FALSE for
#'     English units (in)
#' 
#' @note
#' For sieves larger than the no. 4 sieve, the user should specify the sieve
#' size in inches (e.g., 3/8, 3/4, 1, 1.5, 2, 3, etc.)
#' Either sieve numbers OR grain sizes must be provided.
#' @export
size.from.sieve <- function(sieve, metric){

  sieve.no <- c(3, 2, 1.5, 1, 3/4, 3/8, 4, 8, 10, 16, 20, 30, 40, 50, 60, 100, 140, 200)
  sieve.in <- c(3, 2, 1.5, 1, 3/4, 3/8, 0.187, 0.0929, 0.0787, 0.0465, 0.0335, 0.0236,
                0.0167, 0.0118, 0.00984, 0.00591, 0.00417, 0.00295)
  sieve.mm <- c(75, 50, 37.5, 25, 19, 9.5, 4.75, 2.36, 2.00, 1.18, 0.850, 0.600, 0.425,
                0.300, 0.250, 0.150, 0.106, 0.075)
  size <- vector(length = length(sieve))
    if(metric == TRUE){
      for(i in 1:length(sieve)){
        size[i] <- sieve.mm[match(sieve[i], sieve.no)]
      }
    } else{
      if(metric == FALSE){
        for(i in 1:length(sieve)){
          size[i] <- sieve.in[match(sieve[i], sieve.no)]
        }
      }
    }

  return(size)
}




#' Grain-Size Plot
#' 
#' Produces the grain-size plot. 1 December 2015
#' 
#' 
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return Plot of soil's grain-size distribution
#' 
#' @param sieve = vector of sieve numbers according to ASTM D422
#' @param size = vector of grain sizes (in or mm)
#' @param percent = vector of percent passing
#' @param metric = logical variable: TRUE for metric units (mm), FALSE for
#'    English units (in)
#' 
#' @examples
#' sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
#' percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82) 
#' grainSize.plot(sieve = sieve.example, percent = percent.example, metric =
#' TRUE)
#' 
#' @note
#' For sieves larger than the no. 4 sieve, the user should specify the sieve
#' size in inches (e.g., 3/8, 3/4, 1, 1.5, 2, 3, etc.)
#' Either sieve numbers OR grain sizes must be provided.
#' @export
grainSize.plot <- function(sieve = NA, size = NA, percent, metric){

  ##  Obtain grain sizes from sieves, if sieve numbers are provided
  if(all(is.na(sieve) == FALSE)){
    size <- size.from.sieve(sieve = sieve, metric = metric)
  }
    
  ##  Axis labels
  if(metric == TRUE){
    xlab <- "Particle size, D (mm)"
  } else{
    if(metric == FALSE){
      xlab <- "Particle size, D (in)"
    }
  }
  
  ##  Create plot
  oldpar <- par(no.readonly = TRUE) # code line i
  on.exit(par(oldpar)) # code line i + 1
  par(las = 1, cex = 1.1)
  plot(x = size, y = percent, log = "x", xaxt = "n", yaxs = "i",
       main = "Particle size distribution", xlab = xlab,
       ylab = "Percent finer by weight", ylim = c(0,100),
       pch = 16, lwd = 4)
  lines(x = size, y = percent, lwd = 2)
  ##  Add logarithmic axis and vetical gridlines
  logAxis(x = size, gridY = TRUE)
  ##  Add horizontal gridlines in increments of 10
  abline(h = seq(from = 0, to = 100, by = 10), col = "gray50")
  
  ##  Replot points and lines (so they are on top of the plot)
  points(size, percent, pch = 16, lwd = 4)
  lines(size, percent, lwd = 2)
  
  ##  Add box back to border
  box()
}







#' Percent Components (Grain-Size Distributions)
#' 
#' Calculates the percent components. 1 December 2015
#' 
#' 
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return A three-element list containing: pg = Percent gravel, ps = Percent
#'     sand, and pf = Percent fines 
#'             
#'             
#'             
#' 
#' @param sieve = vector of sieve numbers according to ASTM D422
#' @param size = vector of grain sizes (in or mm)
#' @param percent = vector of percent passing
#' @param metric = logical variable: TRUE for metric units (mm), FALSE for
#'     English units (in)
#'
#' @examples
#' sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
#' percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82) 
#' percentComponents(sieve = sieve.example, percent = percent.example, metric =
#' TRUE)
#' 
#' @note
#' For sieves larger than the no. 4 sieve, the user should specify the sieve
#' size in inches (e.g., 3/8, 3/4, 1, 1.5, 2, 3, etc.)
#' Either sieve numbers OR grain sizes must be provided.
#' This function assumes that the no. 4 and no. 200 sieves have been used.
#' @export
percentComponents <- function(sieve = NA, size = NA, percent, metric){

  ##  Obtain grain sizes from sieves, if sieve numbers are provided
  if(all(is.na(sieve) == FALSE)){
    size <- size.from.sieve(sieve = sieve, metric = metric)
  }
  
  ##  Obtain percent components
  if(metric == TRUE){
    pg <- 100 - percent[match(4.75, round(size, 2))]
    pf <- percent[match(0.075, round(size, 3))]
    ps <- 100 - pg - pf
  } else{
    if(metric == FALSE){
      pg <- 100 - percent[match(0.187, round(size, 3))]
      pf <- percent[match(0.003, round(size, 3))]
      ps <- 100 - pg - pf
    }
  }
  
  ##  Return
  return(list(pg = pg, ps = ps, pf = pf))
}






#' D-Size (Grain-Size Distributions)
#' 
#' Calculates the diameter size. 1 December 2015
#' 
#' 
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return The grain size corresponding to a certain percent finer (N), given a
#'     grain-size distribution
#' 
#' 
#' @param N = the percent corresponding to the desired D-size
#' @param sieve = vector of sieve numbers (according to ASTM D422) that make up
#'     the grain-size distribution                  
#' @param size = vector of grain sizes (in or mm) of the distribution
#' @param percent = vector of percent passing of the grain-size distribution
#' @param metric = logical variable: TRUE for metric units (mm), FALSE for
#'    English units (in)
#'
#' 
#' @examples
#' sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
#' percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82) 
#' Dsize(N = 50, sieve = sieve.example, percent = percent.example, metric = TRUE)
#' 
#' @note
#' For sieves larger than the no. 4 sieve, the user should specify the sieve size
#' in inches (e.g., 3/8, 3/4, 1, 1.5, 2, 3, etc.)
#' Either sieve numbers OR grain sizes must be provided.  The "metric" variable is
#' only required if sieve numbers are provided.
#' The function uses logarithmic interpolation to calculate the D-size from the
#' provided grain-size distribution
#' Log-linear extrapolation is used for grain sizes beyond the range of the data,
#' and a warning is provided
#' @export
Dsize <- function(N, sieve = NA, size = NA, percent, metric){
  
  ##  Obtain grain sizes from sieves, if sieve numbers are provided
  if(all(is.na(sieve) == FALSE)){
    size <- size.from.sieve(sieve = sieve, metric = metric)
  }
  
  ##  Calculate D-size
  DN <- 10 ^ approx(x = percent, y = log10(size), xout = N)$y
  
  ##  Extrapolate if N is outside the range of data
  if(N > max(percent)){
    delPercent <- sort(percent)[length(percent)] - sort(percent)[length(percent) - 1]
    delSize <- log10(sort(size))[length(size)] - log10(sort(size))[length(size) - 1]
    slope <- delSize / delPercent
    DN <- 10 ^ (log10(sort(size))[length(size)] + slope * (N - sort(percent)[length(percent)]))
    warning("Desired percent is beyond the range of the data; extrapolation is used.")
  } else{
    if(N < min(percent)){
      delPercent <- sort(percent)[2] - sort(percent)[1]
      delSize <- log10(sort(size))[2] - log10(sort(size))[1]
      slope <- delSize / delPercent
      DN <- 10 ^ (log10(sort(size))[1] - slope * (sort(percent)[1] - N))
      warning("Desired percent is beyond the range of the data; extrapolation is used.")
    }
  }
  ##  Return
  return(DN)
}





#' Coefficients of Uniformity and Curvature (Grain-Size Distributions)
#' 
#' Calculates the coefficients of uniformity and curvature. 1 December 2015
#' 
#' 
#' 
#' 
#' @author Kyle Elmy and Jim Kaklamanos
#' 
#'  
#' 
#' 
#' 
#' @encoding UTF-8
#' 
#' 
#' 
#' @return A two-element list containing: Cu = Coefficient of uniformity (D60 /
#'     D10) and Cc = Coefficient of curvature (D30^2 / (D10 * D60))
#'             
#'             
#' 
#' @param percent = vector of percent passing
#' @param sieve = vector of sieve numbers according to ASTM D422
#' @param size = vector of grain sizes
#' @param D10 = D-sizes corresponding to 10 percent
#' @param D30 = D-sizes corresponding to 30 percent
#' @param D60 = D-sizes corresponding to 60 percent
#' 
#' @examples
#' 
#' # Example 1
#' 
#' sieve.example <- c(3/8, 4, 10, 20, 40, 140, 200)
#' percent.example <- c(95.72, 90.23, 81.49, 66.36, 50.00, 8.51, 4.82) 
#' grainSize.coefs(sieve = sieve.example, percent = percent.example)
#' 
#' 
#' # Example 2
#' 
#' grainSize.coefs(D60 = 0.10, D30 = 0.03, D10 = 0.002)
#' 
#' 
#' @note
#' For sieves larger than the no. 4 sieve, the user should specify the sieve
#' size in inches (e.g., 3/8, 3/4, 1, 1.5, 2, 3, etc.)
#' The user has three options for input to this function:
#' 1.  Sieve numbers (sieve); and percent passing
#' 2.  Grain sizes (size); and percent passing
#' 3.  D10, D30, and D60; and percent passing
#' @export
grainSize.coefs <- function(percent, sieve = NA, size = NA, D10 = NA, D30 = NA, D60 = NA){

  if(is.na(D10) == TRUE && is.na(D30) == TRUE && is.na(D60) == TRUE){
  
    ##  Obtain grain sizes from sieves, if sieve numbers are provided
    if(all(is.na(sieve) == FALSE)){
      size <- size.from.sieve(sieve = sieve, metric = FALSE)
    }
    
    ##  Obtain D sizes
    if(all(is.na(size) == FALSE)){
      D10 <- Dsize(N = 10, size = size, percent = percent)
      D30 <- Dsize(N = 30, size = size, percent = percent)
      D60 <- Dsize(N = 60, size = size, percent = percent)
    }
  }
  
  
  ##  Calculate Cu and Cc
  Cu <- D60 / D10
  Cc <- D30^2 / (D10 * D60)

  ##  Return
  return(list(Cu = Cu, Cc = Cc))
}
