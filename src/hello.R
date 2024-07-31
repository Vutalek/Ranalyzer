hello <- "Hello, World!"

message(hello)

wb <- createWorkbook()

addWorksheet(wb, "hello")
writeData(wb, "hello", hello)

save_excel(wb)

save_dashboard("src/hello_dashboard.Rmd")