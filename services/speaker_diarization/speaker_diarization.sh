#!/bin/bash
docker run -it --rm --gpus all -v $PWD/data:/data -v $PWD/cache/speaker_diarization:/root/.cache speaker_diarization:1.0-base python /src/speaker_diarization.py --uuid $1 --file_name $2 --hf_token $3
