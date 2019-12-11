#!/usr/bin/env bash

`eval aws ecr get-login --no-include-email --region eu-central-1`

AWS_ACCOUNT=621740939950
ECR_REPOSITORY=621740939950.dkr.ecr.eu-central-1.amazonaws.com/witek-szkolenie

DESTINATION_REPOSITORY_HOSTNAME="${AWS_ACCOUNT}.dkr.ecr.eu-central-1.amazonaws.com"
IMAGE_TAG='latest'

docker build -t witek .
docker tag witek:latest 621740939950.dkr.ecr.eu-central-1.amazonaws.com/witek-szkolenie:latest
docker push 621740939950.dkr.ecr.eu-central-1.amazonaws.com/witek-szkolenie:latest


docker logout ${DESTINATION_REPOSITORY_HOSTNAME}

echo "Operation complete"
