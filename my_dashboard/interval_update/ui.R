shinyUI(basicPage(
  selectInput("interval", "update each:", c(
    "10 seconds" = "10000",
    "3 second" = "3000",
    "1 second" = "1000"
  ), selected = 1000, selectize = FALSE),
  mainPanel(plotOutput("plot"))
))
