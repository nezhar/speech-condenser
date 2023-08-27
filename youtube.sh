#!/bin/bash

#!/bin/bash
set -o errexit

YOUTUBE_URL=$1

podman run --rm -v $PWD/data:/data sc-pytube:0.0.1 python /src/script.py --youtube_url $YOUTUBE_URL
