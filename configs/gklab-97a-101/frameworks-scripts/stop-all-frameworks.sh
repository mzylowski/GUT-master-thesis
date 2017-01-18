#!/bin/bash

systemctl stop marathon
systemctl stop singularity

docker rm -f marathon
docker rm -f singularity
