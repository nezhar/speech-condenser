#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

$SC_RUNTIME run -it --rm --gpus all -v $PWD/data:/data -v $PWD/cache/pyannote:/root/.cache sc-pyannote-cuda:0.0.1 python3 /src/pyannote.py --uuid $1 --file_name $2 --hf_token $3
