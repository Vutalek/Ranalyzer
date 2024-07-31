library(DBI)
library(httr2)

query_result <- function(query_file) {
  sql_text <- readLines(query_file, warn = FALSE, encoding = "UTF-8")
  con <- dbConnect(odbc::odbc(),
                   .connection_string = settings$CONNECTION_STRING, 
                   timeout = 10)
  query_result <- dbGetQuery(con, paste(sql_text, collapse = "\n"))
  dbDisconnect(con)
  return (query_result)
}

api_result <- function(params) {
  req <- request(settings$API_URL)
  resp <- req |> 
    req_headers(Authorization = paste("OAuth", settings$API_TOKEN)) |>
    req_url_query(!!!params) |>
    req_perform()
  resp |> 
    resp_body_string() |>
    readr::read_csv() -> data
  return(data)
}