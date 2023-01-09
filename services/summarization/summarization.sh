#!/bin/bash
docker run -it --rm --gpus all -v $PWD/data:/data -v $PWD/cache/summarization:/root/.cache summarization:1.0-base python /src/summarization.py --uuid $1 --file_name $2
