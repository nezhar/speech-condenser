#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

$SC_RUNTIME run --rm -v $PWD/data:/data sc-combine_asr_rttm:0.0.1 python /src/combine_asr_rttm.py --uuid "$1" --file_name "$2"
