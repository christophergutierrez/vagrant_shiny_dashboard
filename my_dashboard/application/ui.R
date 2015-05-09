sql <- 'select country_name from country;'
sql.df <- sqldf(sql)
shinyUI(
  pageWithSidebar(
      headerPanel("Application"),
      sidebarPanel(
          selectInput("v_country", "Country traveling from:", choices = sql.df, selected="United States"),
          textInput("v_firstname", "First name:", value = ""),
          textInput("v_lastname", "Last name:", value = ""),
          textInput("v_email", "Email:", value = ""),
          selectInput("v_max_degree", "Highest degree:", choices = c("High School","BS","MS", "PhD"), selected = "BS"),
          textInput("v_degree_in", "Degree in:", value =""),
          selectInput("v_cohort", "Cohort you would be available to attend (may select more than one):", choices = c("2015: July 13 - Aug 21","2015: Sep 14 - Oct 23", "2016 or later"), multiple=TRUE),
          submitButton(text="Apply")
          ),
      mainPanel("",
                  leafletOutput("o_plot")
                )
    )
)
