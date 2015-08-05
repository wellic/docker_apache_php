#!/usr/bin/env bash

./00_stop.sh

cd images 
#docker build --no-cache=true -t tutorial/apache .
docker build -t tutorial/apache .
