# geotech

A compilation of functions for performing calculations and creating plots that commonly arise in geotechnical engineering and soil mechanics. The types of calculations that are included are:  

1) phase diagrams and index parameters,
2) grain-size distributions,
3) plasticity,
4) soil classification,
5) compaction,
6) groundwater,
7) subsurface stresses geostatic and induced),
8) Mohr circle analyses,
9) consolidation settlement and rate,
10) shear strength,
11) bearing capacity,
12) lateral earth pressures,
13) slope stability, and
14) subsurface explorations.

Geotechnical engineering students, educators, researchers, and practitioners will find this package useful.  

This package was originally created by Dr. James Kaklamanos and his student, Kyle Elmy, at Merrimack College.  



# Installation of geotech from CRAN

```R
install.packages("geotech")
```



# Help

With credit due to the `matlab` package, for a complete list of functions and the package DESCRIPTION file, use:  

```R
library(help = "geotech")
```


With credit due to [Getting Help with R](https://www.r-project.org/help.html) for the following 2 methods of help:  


```R
help(sigmaZ, package = "geotech") # Vertical Stress at a Point function help

help(package = "geotech") # help for the geotech package
```



# Additional Information

The following link provides additional information written about the `geotech` R package:  

https://www.geoengineer.org/education/soil-mechanics/development-of-a-geotechnical-engineering-software-package-in-r-by-dr-james-kaklamanos-merrimack-college  
Geoengineer.org: Geotechnical Engineering News & Technical Resources for Geotech Professionals: Geotechnical engineering software package in R, by Dr. James Kaklamanos (Merrimack College)  



# New Maintainer

Irucka Embry, EIT, ME of [EcoC&sup2;S](https://www.ecoccs.com) is the new maintainer for this package. His undergraduate, graduate, and professional experience was in civil, environmental, and/or water resources engineering. Irucka's undergraduate civil engineering coursework included geotechnical engineering and soil mechanics. Irucka uses the `geotech` package in his "Sand Gradation Analysis using ASTM C136 with R" example available at https://www.ecoccs.com/R-Examples/sand-gradation.html.  
