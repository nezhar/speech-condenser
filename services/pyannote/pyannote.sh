#!/bin/bash
podman run -it --rm -v $PWD/data:/data -v $PWD/cache/pyannote:/root/.cache sc-pyannote:0.0.1 python /src/pyannote.py --uuid $1 --file_name $2 --hf_token $3
