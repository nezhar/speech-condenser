#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi


$SC_RUNTIME run --rm -v $PWD/data:/files jrottenberg/ffmpeg -i "/files/input/$2" "/files/tmp/$1/wav/${2/\.mp4/\.wav}"
