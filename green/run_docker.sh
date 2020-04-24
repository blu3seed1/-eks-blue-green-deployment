#!/usr/bin/env bash

## Local Docker Deployment

# Build image and add a descriptive tag
docker build --tag=deploygreen .

# List docker images
docker image ls
 
# Run app
docker run -p 8000:80 deploygreen
