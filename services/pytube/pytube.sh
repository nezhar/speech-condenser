#!/bin/bash
set -o errexit

if [ -f .env ]; then
  source .env
fi

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

if [ -z "$1" ]
then
    echo "Youtube URL is not set"
    exit 1
fi

if [ -z "$2" ]
then
    echo "Output path is not set"
    exit 1
fi

$SC_RUNTIME run --rm -v $PWD/data:/data sc-pytube:0.0.1 python /src/script.py --youtube_url "$1" --output_path "$2"
