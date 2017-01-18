#!/bin/bash

cp frameworks-scripts/marathon.service /etc/systemd/system/marathon.service

systemctl daemon-reload
systemctl start marathon
