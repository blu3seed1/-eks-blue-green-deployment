#!/usr/bin/env bash
#This file tags and uploads an image to Docker Hub or ECR

#Docker image must be created before uploading to remote repository

#Create dockerpath
#dockerpath=<your docker ID/path>
dockerpath=deploygreen
  
#Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username bpyne
docker tag deploygreen bpyne/deploygreen

#Push image to a docker repository
docker push bpyne/deploygreen
