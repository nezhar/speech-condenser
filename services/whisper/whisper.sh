#!/bin/bash
set -o errexit

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

chunks=($(wc -l data/tmp/$1/rttm/$2.rttm))

for ((i=0;i<chunks;i++)); do
    $($SC_RUNTIME run -it --rm -v $PWD/data:/data whisper:1.0-base whisper "/data/tmp/$1/chunks/$2_$i.wav" --output_dir "/data/tmp/$1/asr/" --model base --fp16 False)
done
