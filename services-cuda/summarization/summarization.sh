#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

$SC_RUNTIME run -it --rm --gpus all -v $PWD/data:/data -v $PWD/cache/summarization:/root/.cache sc-summarization-cuda:0.0.1 python3 /src/summarization-5min.py --uuid "$1" --file_name "$2" --output_file_name "$3"
