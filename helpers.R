
require(shiny)
require(shinyapps)
require(rsconnect)
require(curl)
require(RCurl)
require(httr)
require(Rmonkey)
require(jsonlite)
require(googlesheets)
require(shinyjs)

#local df taking the place of a Google sheet
df1 <- data.frame(name="name1", stringsAsFactors = FALSE)
