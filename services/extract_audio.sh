#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

$SC_RUNTIME run --rm -v $PWD/data:/data jrottenberg/ffmpeg -i "/$2" "/data/tmp/$1/wav/${3}.wav"
