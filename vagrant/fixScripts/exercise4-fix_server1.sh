#!/bin/bash
#add fix to exercise4-server1 here
#We will append an SSH configuration section to the ssh configuration file and append an entry for server2
#Create first line of configuration to server2
echo "Host server2" | sudo tee -a /home/vagrant/.ssh/config
#Add entry for name resolve
echo " HostName 192.168.100.11" | sudo tee -a /home/vagrant/.ssh/config