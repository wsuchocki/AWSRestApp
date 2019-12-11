#!/usr/bin/env bash

`eval aws ecr get-login --no-include-email --region eu-central-1`

: ${AWS_ACCOUNT?Need to set AWS_ACCOUNT environment variable}
: ${ECR_REPOSITORY?Need to set ECR_REPOSITORY environment variable}

DESTINATION_REPOSITORY_HOSTNAME="${AWS_ACCOUNT}.dkr.ecr.eu-central-1.amazonaws.com"
IMAGE_TAG='zima'

SOURCE_IMAGE="${ECR_REPOSITORY}:${IMAGE_TAG}"
DESTINATION_IMAGE="${DESTINATION_REPOSITORY_HOSTNAME}/${ECR_REPOSITORY}:${IMAGE_TAG}"

docker tag ${SOURCE_IMAGE} ${DESTINATION_IMAGE}
docker push ${DESTINATION_IMAGE}

docker logout ${DESTINATION_REPOSITORY_HOSTNAME}

echo "Operation complete"
