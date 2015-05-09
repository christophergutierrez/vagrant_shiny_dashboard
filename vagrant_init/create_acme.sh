echo "Restart postgresql"
sudo service postgresql restart

echo "Create praxisds user"
psql -c "drop role if exists praxisds"
psql -c "create role praxisds password 'praxisds' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN"

echo "Create acme database and load data"
psql -c 'drop database if exists acme --owner praxisds'
psql -c 'create database acme --owner praxisds'
psql -d acme -f /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/fraud.sql
psql -d acme -f /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/funnel.sql
psql -d acme -f /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/country.sql
psql -d acme -f /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/application.sql
psql -d acme -f /vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/gen_risk.sql
