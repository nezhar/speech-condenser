#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

$SC_RUNTIME run --rm -v $PWD/data:/data sc-combine_asr_rttm:0.0.1 python /src/combine_asr_rttm.py --uuid $1 --file_name $2
