#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

if [ -z "$HF_TOKEN" ]
then
    echo "HF_TOKEN is not set"
    exit 1
fi

if [ -z "$1" ]
then
    echo "UUID is not set"
    exit 1
fi

if [ -z "$2" ]
then
    echo "File name is not set"
    exit 1
fi

$SC_RUNTIME run -it --rm --gpus all -v $PWD/data:/data -v $PWD/cache/pyannote:/root/.cache sc-pyannote-cuda:0.0.1 python3 /src/pyannote.py --uuid "$1" --file_name "$2" --hf_token "$HF_TOKEN"
