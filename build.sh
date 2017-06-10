#!/bin/sh
TAG=hello-phoenix
VERSION=0.0.1
APP_NAME=hello_phoenix

docker build . -f Dockerfile.build -t $TAG:build
IMAGE_ID=$(docker build . -f Dockerfile.build -t $TAG:build -q)
TEMP_CONTAINER=$(docker create $IMAGE_ID)
docker cp $TEMP_CONTAINER:/_build/prod/rel/$APP_NAME/releases/$VERSION/$APP_NAME.tar.gz .
docker rm $TEMP_CONTAINER
docker build . -f Dockerfile.release -t $TAG
rm $APP_NAME.tar.gz
