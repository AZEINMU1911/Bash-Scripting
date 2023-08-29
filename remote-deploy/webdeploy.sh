#!/bin/bash

USR='devops'
for host in `cat remhost`
do
	echo "Connecting to host $host"
	echo "Pushing script to $host"
	sudo scp multi-os-websetup.sh $USR@$host:/tmp/
	ssh $USR@$host sudo /tmp/multi-os-websetup.sh
	echo "Deleting files"
	ssh $USR@$host sudo rm -rf /tmp/multi-os-websetup.sh
done
