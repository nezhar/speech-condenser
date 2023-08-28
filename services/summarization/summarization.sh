#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

$SC_RUNTIME run -it --rm -v $PWD/data:/data -v $PWD/cache/summarization:/root/.cache sc-summarization:0.0.1 python /src/summarization-5min.py --uuid $1 --file_name $2
