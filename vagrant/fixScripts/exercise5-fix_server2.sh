#!/bin/bash
#add fix to exercise5-server2 here
#Disable host checking for connections (can be filtered for specific IP)
echo "Host *" | sudo tee -a /home/vagrant/.ssh/config
echo " StrictHostKeyChecking no" | sudo tee -a /home/vagrant/.ssh/config
#Enabling password authentication for SSH 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service ssh restart
#Generating SSH certificate as vagrant user
sudo runuser -l vagrant -c 'ssh-keygen -N "" -f /home/vagrant/.ssh/id_rsa'
#Installing SSHPass to connect without prompts
sudo apt-get update
sudo apt-get install sshpass -y
#Copying SSH certs. to the shared env. folder
sudo rm -rf /vagrant/server2
sudo mkdir /vagrant/server2
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server2/id_rsa.pub
#Adding the generated SSH cert. from server1 to our local authorized keys file
sudo cat /vagrant/server1/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
#Copying the generated certificate to the other server
#the reason we ssh to an ip address and not a hostname is due to the fact that script 4 runs after script 5 only on server2
sudo runuser -l vagrant -c "/usr/bin/sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@192.168.100.10 'sudo cat /vagrant/server2/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys'"