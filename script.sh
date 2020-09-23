#!/bin/bash

cd $(dirname $0)

#build image
read -p "do you want to build this image ? (y/n):" yn
if [ ${yn,,} = "y" ]; then
	podman rmi -f minecraft
	podman build -f Dockerfile -t minecraft:latest
fi
