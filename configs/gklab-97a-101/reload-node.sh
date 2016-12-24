#/bin/bash

# This script should be used only on .101 node !!

echo "Stopping services via systemctl"
systemctl stop marathon
systemctl stop mesos-master
systemctl stop zookeeper

echo "Ensure all services are down, and all containers are removed"
docker rm -f marathon
docker rm -f mesos-master
docker rm -f zookeeper

echo "Applaying new configs"
cp mesos-master.service /etc/systemd/system/mesos-master.service
cp marathon.service /etc/systemd/system/marathon.service
cp zookeeper.service /etc/systemd/system/zookeeper.service

echo "Reloading systemd"
systemctl daemon-reload

echo "Running services with new configs"
systemctl restart zookeeper
systemctl restart mesos-master
systemctl restart marathon
