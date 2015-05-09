echo "Install postgres and configure"
sudo apt-get install -y postgresql-9.3
sudo apt-get install -y libpq-dev

echo "Set postgresql accessability"
sudo sed -i s/peer$/ident/ /etc/postgresql/9.3/main/pg_hba.conf

# TYPE
sudo sed -i '/# TYPE/a local all praxisds md5' /etc/postgresql/9.3/main/pg_hba.conf

sudo cp /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/create_acme.sh /tmp/

sudo su postgres -c '/tmp/create_acme.sh'
