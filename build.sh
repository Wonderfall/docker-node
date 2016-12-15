#!/bin/bash

FOLDER=$(dirname $0)
DOCKER_PUSH=$1
CSI="\033["
CEND="${CSI}0m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"

# Download dependencies
docker pull xataz/alpine:3.4

push() {
    image_name=$1
    
    if [ "$DOCKER_PUSH" == "push" ]; then
        echo -e "${CYELLOW}Push ${image_name}${CEND}"
        docker push ${image_name}
        echo -e "${CYELLOW}                       ---                                   "
        echo -e "Successfully push ${image_name}"
        echo -e "                       ---                                   ${CEND}"
    fi
}

# Build node
## Latest
for tag in $(grep 'tags=' $FOLDER/latest/Dockerfile | cut -d'"' -f2); do
    docker build -t xataz/node:$tag $FOLDER/latest/
    if [ $? == 0 ]; then
        docker push "xataz/node:$tag"
    else
        exit 1
    fi
done
for tag in $(grep 'tags=' $FOLDER/latest/Dockerfile.onbuild | cut -d'"' -f2); do
    docker build -t xataz/node:$tag -f $FOLDER/latest/Dockerfile.onbuild $FOLDER/latest/
    if [ $? == 0 ]; then
        docker push "xataz/node:$tag"
    else
        exit 1
    fi
done

## LTS
for tag in $(grep 'tags=' $FOLDER/lts/Dockerfile | cut -d'"' -f2); do
    docker build -t xataz/node:$tag $FOLDER/lts/
    if [ $? == 0 ]; then
        docker push "xataz/node:$tag"
    else
        exit 1
    fi
done
for tag in $(grep 'tags=' $FOLDER/lts/Dockerfile.onbuild | cut -d'"' -f2); do
    docker build -t xataz/node:$tag -f $FOLDER/lts/Dockerfile.onbuild $FOLDER/lts/
    if [ $? == 0 ]; then
        docker push "xataz/node:$tag"
    else
        exit 1
    fi
done
