#!/bin/bash
docker run --rm -v $PWD/data:/data combine_asr_rttm:1.0-base python /src/combine_asr_rttm.py --uuid $1 --file_name $2
