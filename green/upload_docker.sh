#!/usr/bin/env bash
#This file tags and uploads an image to Docker Hub or ECR

# Docker image must be created before uploading to remote repository

# Create dockerpath
# dockerpath=<your docker ID/path>
#DOCPATH=deploygreen
DOCPATH="818176152437.dkr.ecr.us-east-1.amazonaws.com/deploygreen:capstone"

# Authenticate and tag
echo "Docker ID and Image: ${DOCPATH}"

# Autheticate with Docker Hub or ECR
#docker login --username bpyne
aws ecr get-login --no-include-email --region us-east-1 | awk '{print $6}' | docker login -u AWS --password-stdin 818176152437.dkr.ecr.us-east-1.amazonaws.com/
deploygreen

# tag image
#docker tag deployblue:capstone bpyne/${DOCPATH}
docker tag deploygreen:capstone ${DOCPATH}

# Push image to a docker repository
#docker push bpyne/deployblue
docker push ${DOCPATH}
