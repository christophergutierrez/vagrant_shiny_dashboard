suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(RPostgreSQL))
suppressPackageStartupMessages(library(sqldf))
suppressPackageStartupMessages(library(leaflet))

# Set options once so don't need to put into every database call
# This needs to be moved to an exernal file later for security.
options(sqldf.RPostgreSQL.user ="praxisds", 
        sqldf.RPostgreSQL.password ="praxisds",
        sqldf.RPostgreSQL.dbname ="acme",
        sqldf.RPostgreSQL.host ="localhost", 
        sqldf.RPostgreSQL.port =5432)
