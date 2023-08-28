#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

chunks=($(wc -l data/tmp/$1/rttm/$2.rttm))

for ((i=0;i<chunks;i++)); do
    $SC_RUNTIME run -it --rm --gpus all -v $PWD/data:/data sc-whisper-cuda:0.0.1 whisper /data/tmp/$1/chunks/$2_$i.wav --output_dir /data/tmp/$1/asr/ --model base --fp16 True --language English
done
