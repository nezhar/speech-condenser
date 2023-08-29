#!/bin/bash
set -o errexit

if [ -f .env ]; then
  source .env
fi

if [ -z "$1" ]
then
    echo "Youtube URL is not set"
    exit 1
fi

output_path="data/input/$(date +%s)"
mkdir -p $output_path

SC_RUNTIME=$SC_RUNTIME ./services/pytube/pytube.sh $1 $output_path

for file in $output_path/*; do
    ./pipeline.sh "$file"
done
