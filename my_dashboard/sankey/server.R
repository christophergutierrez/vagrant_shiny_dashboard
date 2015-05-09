shinyServer(function(input, output){

  sql <- "SELECT page as source, target, page_count as value
    FROM v_funnel
    WHERE
      (traffic_type = '_TRAFFIC_TYPE_'
      OR '_TRAFFIC_TYPE_' = 'all')
      AND tx_date BETWEEN '_START_DATE_' AND '_END_DATE_'
    ;"

  data <- reactive({
    sql <- gsub('_TRAFFIC_TYPE_', input$v_type, sql)
    sql <- gsub('_START_DATE_', input$v_dateRange[1], sql)
    sql <- gsub('_END_DATE_', input$v_dateRange[2], sql)
    data <- sqldf(sql)
    return(data)
  })
 
  output$table <- renderTable({
    return(data())

  })
 
  output$sankey <-  renderChart2({ 
    sankeyPlot <- rCharts$new()
    sankeyPlot$setLib("./rCharts_d3_sankey-gh-pages/libraries/widgets/d3_sankey")

    sankeyPlot$set(
      data = data(),

      nodeWidth = 15,
      nodePadding = 10,
      layout = 32,
      width = 500,
      height = 500
    )
    return(sankeyPlot)
  })
})

