## ---- include = FALSE---------------------------------------------------------
library(weathercan)

## ---- eval = FALSE------------------------------------------------------------
#  # Work
#  library(weathercan)
#  s <- stations_search("Winnipeg", normals_years = "current")
#  w <- weather_dl(s, interval = "month", start = "2021-01-01")
#  
#  # Reproducibility
#  stations_meta()
#  citation('weathercan')
#  devtools::session_info() # Install devtools if you don't have it

## ---- eval = TRUE, echo = FALSE, highlight=1----------------------------------
library(weathercan)
# Reproducibility
stations_meta()
citation('weathercan')
if(requireNamespace("devtools", quietly = TRUE)) devtools::session_info()

