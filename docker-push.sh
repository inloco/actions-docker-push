#!/bin/bash

set -e

IMAGE_REGISTRY=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com

for IMAGE_REPO in ${IMAGE_REPOS}
do
    echo "docker tag '${IMAGE_REPO}' '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}'"
done | parallel --lb

for IMAGE_REPO in ${IMAGE_REPOS}
do
    echo "docker push '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}'"
done | parallel --lb
