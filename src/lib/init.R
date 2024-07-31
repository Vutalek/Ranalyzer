source("src/lib/installs.R")

library(jsonlite)
library(flexdashboard)
library(knitr)

settings <- fromJSON("settings.json")

source("src/lib/retrieve_functions.R")
source("src/lib/save_functions.R")

dir.create("output", showWarnings = FALSE)