#/bin/bash

# This script should be used only on .101 node !!

echo "Stopping services via systemctl"
systemctl stop mesos-master
systemctl stop zookeeper

echo "Ensure all services are down, and all containers are removed"
docker rm -f mesos-master
docker rm -f zookeeper

echo "Applaying new configs"
cp mesos-master.service /etc/systemd/system/mesos-master.service
cp zookeeper.service /etc/systemd/system/zookeeper.service

echo "Reloading systemd"
systemctl daemon-reload

echo "Running services with new configs"
systemctl restart zookeeper
systemctl restart mesos-master

./frameworks-scripts/stop-all-frameworks.sh
if [ -z "$1" ]; then
	echo "Mesos started without scheduler"
else
	echo "Starting $1 scheduler..."
	./frameworks-scripts/$1.sh	 
fi
