#!/bin/bash
docker run -u $(id -u ${USER}):$(id -g ${USER}) --rm -v $PWD/data:/files jrottenberg/ffmpeg -i "/files/input/$2" "/files/tmp/$1/wav/${2/\.mp4/\.wav}"
