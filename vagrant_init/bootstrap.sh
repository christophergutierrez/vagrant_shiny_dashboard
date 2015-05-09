#!/bin/bash
echo "Setup"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/init.sh

echo "Install postgresql"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/postgressql_install.sh

echo "git pull"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/git.sh

echo "Install Apache"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/apache_install.sh

echo "Install R components"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/r_install.sh

echo "Install Shiny Server components"
/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/shiny_server.sh

