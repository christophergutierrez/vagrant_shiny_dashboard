shinyUI(bootstrapPage(
  div(
    class="container-fluid",
    div(class="row-fluid",
       headerPanel("User Funnel")
    ),
    div(class="row-fluid",
        sidebarPanel(
          h4("Filter Criteria"),
        dateRangeInput('v_dateRange',
          label = 'Date range(yyyy-mm-dd)',
            # Minimum to allow control to select
            , min = Sys.Date() - 30
            # Maximum to allow control to select
            , max = Sys.Date()
            , start = Sys.Date() - 30, end = Sys.Date()
        ),
        selectInput(
            # type will be passed to server.R
            inputId = "v_type",
            # Label to display above control
            label = "Choose Traffic Type",
            # Choses what to populate type with.
            choices = c("all", "http", "mobile"),
            # Default selection
            selected = "multiBarChart")
        ),
        mainPanel(
          #tableOutput("table"),
           showOutput('sankey', 'd3_sankey')
        )
    )
  )
))
