#/bin/bash

# This script should be used only on .104 node !!

echo "Stopping services via systemctl"
systemctl stop mesos-slave

echo "Ensure all services are down, and all containers are removed"
docker rm -f mesos-slave

echo "Applaying new configs"
cp mesos-slave.service /etc/systemd/system/mesos-slave.service

echo "Reloading systemd"
systemctl daemon-reload

echo "Running services with new configs"
systemctl restart mesos-slave
