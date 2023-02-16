#!/bin/bash

docker build -t liatrio-drew .
docker run -d -p 8080:3000 liatrio-drew
sleep 3
open http://localhost:8080