## ---- include = FALSE-------------------------------------------------------------------
old <- options(tibble.max_extra_cols = 0, width = 90)

## ----setup, message = FALSE-------------------------------------------------------------
library(weathercan)
library(tidyr)
library(dplyr)
library(naniar) # For exploring missing values

## ---------------------------------------------------------------------------------------
stations_search("Winnipeg", normals_years = "current")

## ---------------------------------------------------------------------------------------
n <- normals_dl(climate_ids = "5023222")
n

## ---------------------------------------------------------------------------------------
normals <- unnest(n, normals)
frost <- unnest(n, frost)

## ---- R.options = list(tibble.print_max = Inf)------------------------------------------
normals

## ---- eval = FALSE, fig.asp = 2, out.width = "100%", fig.width = 8----------------------
#  select(normals, -contains("_code")) %>%  # Remove '_code' columns
#    gg_miss_var(facet = station_name)

## ---- warning = FALSE, fig.asp = 2, out.width = "100%", fig.width = 8-------------------
suppressWarnings({select(normals, -contains("_code")) %>%  # Remove '_code' columns
    gg_miss_var(facet = station_name)})

## ---- R.options = list(width = 90)------------------------------------------------------
if("normals" %in% names(frost)) frost <- select(frost, -normals) # tidyr v1
glimpse(frost)

## ---------------------------------------------------------------------------------------
normals_measurements

## ---------------------------------------------------------------------------------------
normals_measurements %>%
  filter(stringr::str_detect(measurement, "soil"),
         normals == "1981-2010") %>%
  pull(climate_id) %>%
  unique()

## ---- include = FALSE---------------------------------------------------------
# Reset options
options(old)

