#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

$SC_RUNTIME run --rm -v $PWD/data:/data sc-pytube:0.0.1 python /src/script.py --youtube_url $1
