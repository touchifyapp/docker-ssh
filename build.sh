#!/bin/bash

VERSION="$(cat VERSION)"

VERSION_MAJOR_PART=$(echo "$VERSION" | cut -d'.' -f1)
VERSION_MINOR_PART=$(echo "$VERSION" | cut -d'.' -f2)

VERSION_MAJOR="$VERSION_MAJOR_PART"
VERSION_MINOR="$VERSION_MAJOR_PART.$VERSION_MINOR_PART"

docker build \
 -t touchifyapp/ssh \
 -t touchifyapp/ssh:latest \
 -t touchifyapp/ssh:$VERSION_MAJOR \
 -t touchifyapp/ssh:$VERSION_MINOR \
 -t touchifyapp/ssh:$VERSION \
 .
