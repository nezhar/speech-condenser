#!/bin/bash

#!/bin/bash
set -o errexit

YOUTUBE_URL=$1

docker run --rm -v $PWD/data:/data pytube:1.0-base python /src/script.py --youtube_url $YOUTUBE_URL
