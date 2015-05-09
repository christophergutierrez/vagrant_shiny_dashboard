#!/bin/bash
echo "Provisioning virtual machine..."

echo "Add R keys"
echo 'deb http://cran.cnr.Berkeley.edu/bin/linux/ubuntu trusty/' | sudo tee --append /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

echo "apt-get update"
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y sqlite

