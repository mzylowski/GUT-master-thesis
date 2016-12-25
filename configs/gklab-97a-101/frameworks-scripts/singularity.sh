#!/bin/bash

cp frameworks-scripts/singularity.service /etc/systemd/system/singularity.service
cp frameworks-scripts/singularity.yaml /mesos-dockerized/singularity/singularity.yaml

systemctl daemon-reload
systemctl start singularity
