echo "Base apache2"
sudo apt-get install -y apache2

sudo rm /var/www/html/index.html
sudo ln -s /vagrant/git_home/vagrant_shiny_dashboard/my_dashboard/site/index.html /var/www/html/index.html
sudo ln -s /vagrant/git_home/vagrant_shiny_dashboard/my_dashboard/css /var/www/html/css
sudo ln -s /vagrant/git_home/vagrant_shiny_dashboard/my_dashboard/site /var/www/html/site
