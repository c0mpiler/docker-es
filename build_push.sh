#! /usr/bin/env bash

docker build -t c0mpiler/es:6.8.3 . &&
docker tag c0mpiler/es:6.8.3 c0mpiler/es:latest &&
docker system prune -f
docker push c0mpiler/es:6.8.3 &&
docker push c0mpiler/es:latest
