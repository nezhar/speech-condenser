#!/bin/bash
podman run --rm -v $PWD/data:/data sc-audiochunks:0.0.1 python /src/audio_chunks.py --uuid $1 --file_name $2
