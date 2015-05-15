# vagrant_shiny_dashboard
The purpose of this repos is to provide an easy method to get a complete reporting system powered by shiny server running.

It assumes you have Vagrant installed and used the box ubuntu/trusty64

Note this takes a few minutes in human time, but could take hours in downloading and running.

Steps to make this work:

- mkdir -p shiny/git_home
- cd shiny/git_home/
- git clone https://github.com/christophergutierrez/vagrant_shiny_dashboard.git
- git clone https://github.com/rstudio/shiny-examples.git #optional
- cd ..
- ln -s git_home/vagrant_shiny_dashboard/vagrant_init/Vagrantfile Vagrantfile
- vagrant up 

I plan to add information on how to make the overall system scale well and fit into a production ready work flow. **Warning**, I am terrible at front end development so cover your childrens' eyes if you open the HTML.

Special thanks to:
- Jonathan McPherson: https://github.com/rstudio/rstudio
- Ramnath Vaidyanathan: https://github.com/ramnathv/rCharts
- Winston Chang: https://github.com/rstudio/shiny-examples

I took liberally from their great work.
