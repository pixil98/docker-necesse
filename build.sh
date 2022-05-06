#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Usage: build.sh <necesse-server-zip>"
        exit 1
fi

SERVER_ZIP=$1

rm -rf .build
mkdir .build

unzip -a -d .build/server ${SERVER_ZIP}

pushd .build/server
files=(*)
SERVER_FOLDER=${files[0]}
popd

# Make binaries executable
chmod +x .build/server/${SERVER_FOLDER}/jre/bin/*

# Parse version out of folder name
IFS='-' read -r -a array <<< "${SERVER_FOLDER}"
VERSION=$(echo ${array[@]:2} | tr ' ' '.')

docker build -t pixil/necesse:${VERSION} -t pixil/necesse:latest --build-arg FOLDER_NAME=${SERVER_FOLDER} .
