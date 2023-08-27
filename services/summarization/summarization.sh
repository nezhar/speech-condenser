#!/bin/bash
podman run -it --rm -v $PWD/data:/data -v $PWD/cache/summarization:/root/.cache sc-summarization:0.0.1 python /src/summarization.py --uuid $1 --file_name $2
