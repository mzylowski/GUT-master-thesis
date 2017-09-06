#!/bin/bash
x=1
curl -X POST http://192.168.0.12:8080/v2/apps -d @job2.json -H "Content-type: application/json"
while [ $x -gt 0 ]; do
        curl --silent --head 192.168.0.13
        x=$?
        echo "Waiting...."
done
