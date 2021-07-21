#!/bin/bash
#add fix to exercise3 here
#we check the configuration path with apachectl -S
#Inside the conf file we need to change the Require all from denied to granted to allow access
sudo sed -i 's/Require all denied/Require all granted/g' /etc/apache2/sites-enabled/000-default.conf
#Then reset the web-server for changes to apply
sudo /etc/init.d/apache2 restart