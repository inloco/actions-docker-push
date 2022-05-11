#!/bin/bash

set -e

IMAGE_REGISTRY=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com

for IMAGE_REPO in ${IMAGE_REPOS}
do
    if [[ ! -z ${IMAGE_SUFFIXES} ]]
    then
        for IMAGE_SUFFIX in ${IMAGE_SUFFIXES}
        do
            echo "docker tag '${IMAGE_REPO}' '${IMAGE_REGISTRY}/${IMAGE_REPO}${IMAGE_SUFFIX}:${IMAGE_TAG}'"
        done
    else
        echo "docker tag '${IMAGE_REPO}' '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}'"
    fi
done

for IMAGE_REPO in ${IMAGE_REPOS}
do
    if [[ ! -z ${IMAGE_SUFFIXES} ]]
    then
        for IMAGE_SUFFIX in ${IMAGE_SUFFIXES}
        do
            echo "docker push '${IMAGE_REGISTRY}/${IMAGE_REPO}${IMAGE_SUFFIX}:${IMAGE_TAG}'"
        done
    else
        echo "docker push '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}'"
    fi
done
