# shiny server
echo "Install shiny server"
sudo apt-get install -y gdebi-core
echo "shiny server package"
sudo gdebi --n /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/shiny-server-1.3.0.403-amd64.deb

sudo ln -s /vagrant/git_home/shiny-examples/ /srv/shiny-server/example
sudo ln -s /vagrant/git_home/vagrant_shiny_dashboard/my_dashboard/ /srv/shiny-server/my_dashboard

sudo mkdir /var/run/shiny
sudo chown -R shiny:shiny /var/run/shiny

sudo sed -i "/exec shiny-server/c\exec su -s \/bin\/sh -c 'exec \"\$0\" \"\$@\"' shiny -- shiny-server --pidfile=\/var\/run\/shiny\/shiny-server.pid >> \/var\/log\/shiny-server.log 2>&1" /etc/init/shiny-server.conf
