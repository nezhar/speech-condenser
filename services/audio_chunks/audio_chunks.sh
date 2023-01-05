#!/bin/bash
docker run --rm -v $PWD/data:/data audio_chunks:1.0-base python /src/audio_chunks.py --uuid $1 --file_name $2
