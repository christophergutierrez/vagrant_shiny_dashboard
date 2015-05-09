shinyServer(function(input, output) {

  get.latlng.sql <- "select lat, lng from country where country_name like _country_"
  
  sql <- "select u_load_application('_country_','_first_name_','_last_name_','_email_','_degree_max_','_major_','_cohort_')"
  
  output$o_plot <- renderLeaflet({
    get.latlng.sql <- gsub("_country_", paste("",input$v_country,"", sep="'"), get.latlng.sql)
    get.latlng.sql.df <- sqldf(get.latlng.sql)
    
    emailTemplate <- 'email.template'
    email.txt <- readChar(emailTemplate, file.info(emailTemplate)$size)

    email.txt <- gsub("_country_", input$v_country, email.txt)
    email.txt <- gsub("_first_name_", input$v_firstname, email.txt)
    email.txt <- gsub("_last_name_", input$v_lastname, email.txt)
    email.txt <- gsub("_email_", input$v_email, email.txt)

    emailFile <- gsub("_email_", input$v_email, "/tmp/_email_.txt")

    writeChar(email.txt, emailFile)

    sendEmail <- gsub("_email_", input$v_email, "/usr/sbin/sendmail -t < /tmp/_email_.txt")

    sql <- gsub("_country_", paste("",input$v_country,"", sep='"'), sql)
    sql <- gsub("_first_name_", paste("",input$v_firstname,"", sep='"'), sql)
    sql <- gsub("_last_name_", paste("",input$v_lastname,"", sep='"'), sql)
    sql <- gsub("_email_", paste("",input$v_email,"", sep='"'), sql)
    sql <- gsub("_degree_max_", paste("",input$v_max_degree,"", sep='"'), sql)
    sql <- gsub("_major_", paste("",input$v_degree_in,"", sep='"'), sql)
    sql <- gsub("_cohort_", paste("",input$v_cohort,"", sep='"'), sql)

    m <-leaflet() %>% addTiles()

    ifelse(input$v_email=="","", 
           {
 
              rec_previous <- sqldf(sql);
              m <- m %>% setView(get.latlng.sql.df$lng, get.latlng.sql.df$lat, zoom = 3);
                if(rec_previous == 0){
                  system(sendEmail, wait=FALSE)
                  m <- m %>% addPopups(get.latlng.sql.df$lng, get.latlng.sql.df$lat, 'A confirmation email has been sent! If you do not receive it shortly, please email: apply@praxisds.com')
                  m
                }
              m
            })
    m
  })
})
