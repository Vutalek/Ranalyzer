packages <- c(
  "jsonlite",
  "DBI",
  "httr2",
  "openxlsx",
  "flexdashboard",
  "ggplot2"
)
install.packages(setdiff(packages, rownames(installed.packages())))