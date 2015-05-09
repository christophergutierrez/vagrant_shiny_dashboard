options(digits.secs = 3) # Include milliseconds in time display

shinyServer(function(input, output, session) {

  a <- NA
  output$plot <- renderPlot({
    invalidateLater(as.integer(input$interval), session)
    x <- as.numeric(format(Sys.time(), "%s"))
    y <- x - round(x, -4) + runif(1)*500 -500
    a <- na.omit(c(a, y))
    aa <- rev(a)[1:20]
    a <<- rev(aa)
    plot(a, type='l', main=c('Visitors per', input$interval, 'Milliseconds')
      , ylab='Visitor Count', xlab='Max 20 Datapoint Window')
  })
})
