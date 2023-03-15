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

IMAGE_REGISTRY=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
DOCKER_TAG_COMMANDS=`mktemp`
DOCKER_PUSH_COMMANDS=`mktemp`

for IMAGE in ${IMAGES}
do
    split_image ${IMAGE}
    echo "docker tag '${IMAGE}' '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}${IMAGE_TAG_SUFFIX}'" | tee -a ${DOCKER_TAG_COMMANDS}
    echo "docker push '${IMAGE_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}${IMAGE_TAG_SUFFIX}'" | tee -a ${DOCKER_PUSH_COMMANDS}
done

cat ${DOCKER_TAG_COMMANDS} | parallel --lb
cat ${DOCKER_PUSH_COMMANDS} | parallel --lb
