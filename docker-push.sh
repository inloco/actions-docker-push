#!/bin/bash

set -e

split_image() {
    export IMAGE_REPO="$(sed -En 's/([^:]*).*/\1/p' <<< ${1})"
    export IMAGE_TAG_SUFFIX="$(sed -En 's/.*:(.*)/\1/p' <<< ${1})"
    if [[ ! -z "${IMAGE_TAG_SUFFIX}" ]]
    then
        export IMAGE_TAG_SUFFIX="-${IMAGE_TAG_SUFFIX}"
    fi
}

IMAGE_REGISTRY={AWS_ACCOUNT}.dkr.ecr.{AWS_REGION}.amazonaws.com

for IMAGE in ${IMAGES}
do
    split_image ${IMAGE}
    echo "docker tag '${IMAGE}' '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}${IMAGE_TAG_SUFFIX}'"
done #| parallel --lb

for IMAGE in ${IMAGES} 
do
    split_image ${IMAGE}
    echo "docker push '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}${IMAGE_TAG_SUFFIX}'"
done #| parallel --lb
