#!/bin/bash
#add fix to exercise2 here
#"www.ascii-art.de" was pointed to localhost (in the hosts file), using 'sed' to replace the matching line with an empty one
sudo sed -i 's/127.0.0.1 www.ascii-art.de/ /g' /etc/hosts