#/bin/bash

# This script should be used only on .102 node !!

echo "Stopping services via systemctl"
systemctl stop mesos-slave

echo "Ensure all services are down, and all containers are removed"
docker rm -f mesos-slave

echo "Cleaning logs"
rm -rf /mesos-dockerized/mesos-slave/log/*
rm -rf /mesos-dockerized/mesos-slave/tmp/*

echo "Applaying new configs"
cp mesos-slave.service /etc/systemd/system/mesos-slave.service

echo "Reloading systemd"
systemctl daemon-reload

echo "Running services with new configs"
systemctl restart mesos-slave
