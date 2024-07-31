library(openxlsx)
library(rmarkdown)

save_excel <- function(wb) {
  dir.create("output/Excel", showWarnings = FALSE)
  full_excel_path <- paste0(
    normalizePath(settings$EXCEL_SAVE_PATH),
    "/",
    settings$EXCEL_NAME,
    format(Sys.Date(), "_%d-%m-%Y"),
    ".xlsx"
  )
  
  saveWorkbook(wb, full_excel_path, overwrite = TRUE)
}

save_dashboard <- function(dashboard) {
  Sys.setenv(RSTUDIO_PANDOC = settings$RSTUDIO_PANDOC)
  
  dir.create("output/Dashboards", showWarnings = FALSE)
  full_dashboard_path <- paste0(
    normalizePath(settings$DASHBOARD_SAVE_PATH),
    "/",
    settings$DASHBOARD_NAME,
    format(Sys.Date(), "_%d-%m-%Y"),
    ".html"
  )
  
  rmarkdown::render(dashboard, output_file = full_dashboard_path)
  
  browseURL(full_dashboard_path)
}