echo "r-base"
sudo apt-get install -y r-base
echo "r-rpart"
sudo apt-get install -y r-cran-rpart
echo "r-cran-boot"
sudo apt-get install -y r-cran-boot

sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('plyr', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('googleVis', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('tm', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('wordcloud', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('dplyr', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('ggvis', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('ggplot2', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('htmlwidgets', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('RSQLite', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('RPostgreSQL', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('sqldf', repos='http://cran.cnr.Berkeley.edu/')\""

# shiny
echo "shiny package"
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""

sudo apt-get install -y libcurl4-gnutls-dev
sudo su - -c "R -e \"install.packages('RCurl', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('httr', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.cnr.Berkeley.edu/')\""
sudo su - -c "R -e \"require('devtools'); install_github('ramnathv/rCharts')\""
sudo su - -c "R -e \"require('devtools'); install_github('rstudio/leaflet')\""
sudo su - -c "R -e \"install.packages('rjson', repos='http://cran.cnr.Berkeley.edu/')\""
