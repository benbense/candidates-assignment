#!/bin/bash
#add fix to exercise6-fix here
this_machine_hostname=$HOSTNAME
target_machine_hostname=""
if [ "$this_machine_hostname" = "server1" ]; then 
	target_machine_hostname="server2"
fi

if [ "$this_machine_hostname" = "server2" ]; then 
	target_machine_hostname="server1"
fi
arg_count=0
for i in "$@"
do
	((arg_count=arg_count+1))
done
((arg_count=arg_count-1))
target_location=${@: -1}
index=0
rm -f /vagrant/transfer.log
for i in "$@"
do
if [ "$index" -lt "$arg_count" ]; then
	file_name="$(basename ${i})"
	rsync --stats ${i} vagrant@${target_machine_hostname}:${target_location}${file_name} >> /vagrant/transfer.log
	((index=index+1))
fi
done
raw_sizes="$(grep -oP '(?<=Total transferred file size: ).*?(?= bytes)' /vagrant/transfer.log)"
total_size=0
for size in $raw_sizes
do
	current_size=$(echo $size | sed 's/,//g')
	total_size=$(($total_size + $current_size))
done
echo $total_size
