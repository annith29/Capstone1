#!/bin/bash

echo "Enter image name:"

echo "Enter image version:"

docker build -t $IMAGE_NAME:$IMAGE_VERSION

docker images