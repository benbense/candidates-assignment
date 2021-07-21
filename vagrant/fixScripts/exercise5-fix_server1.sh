#!/bin/bash
#add fix to exercise5-server1 here
#Disable host checking for connections (can be filtered for specific IP)
echo "Host *" | sudo tee -a /home/vagrant/.ssh/config
echo " StrictHostKeyChecking no" | sudo tee -a /home/vagrant/.ssh/config
#Enabling password authentication for SSH 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service ssh restart
#Generating SSH certificate as vagrant user and copying it to the shared env. folder
sudo runuser -l vagrant -c 'ssh-keygen -N "" -f /home/vagrant/.ssh/id_rsa'
sudo rm -rf /vagrant/server1
sudo mkdir /vagrant/server1
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server1/id_rsa.pub