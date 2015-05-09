#!/bin/bash
echo "Performing git pulls"

cd /vagrant/git_home/shiny-examples-master/
git pull origin master
cd /vagrant/git_home/vagrant_shiny_dashboard
git pull origin master

