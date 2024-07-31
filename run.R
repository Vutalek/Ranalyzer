source("src/lib/init.R")

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  message("Specify scenario.")
} else {
  switch(
    args[1],
    "hello" = source("src/hello.R")
  )
}

source("src/lib/exit.R")