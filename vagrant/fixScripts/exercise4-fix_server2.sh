#!/bin/bash
#add fix to exercise4-server2 here
#We will append an SSH configuration section to the ssh configuration file and append an entry for server1
#Create first line of configuration to server1
echo "Host server1" | sudo tee -a /home/vagrant/.ssh/config
#Add entry for name resolve
echo " HostName 192.168.100.10" | sudo tee -a /home/vagrant/.ssh/config