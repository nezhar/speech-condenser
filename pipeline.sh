#!/bin/bash
set -o errexit

if [ -f .env ]; then
  source .env
fi

if [ -z "$1" ]
then
    echo "Input file is not set"
    exit 1
fi

if [ ! -f "$1" ]
then
    echo "Input file does not exist"
    exit 1
fi

if [ -z "$SC_RUNTIME" ]
then
    echo "SC_RUNTIME is not set"
    exit 1
fi

if [ -z "$HF_TOKEN" ]
then
    echo "HF_TOKEN is not set"
    exit 1
fi

JOB_ID=$(uuidgen)
INPUT_FILE_NAME=$(basename -- "$1")

# Create a temporary directories for the job
echo "Job ID: $JOB_ID for $INPUT_FILE_NAME"
mkdir -p "data/tmp/$JOB_ID/wav"
mkdir -p "data/tmp/$JOB_ID/rttm"
mkdir -p "data/tmp/$JOB_ID/chunks"
mkdir -p "data/tmp/$JOB_ID/asr"
mkdir -p "data/tmp/$JOB_ID/asr_rttm_combined"

# Create a log file in the job directory
touch "data/tmp/$JOB_ID/log.txt"
echo "Input file: $INPUT_FILE_NAME" >> "data/tmp/$JOB_ID/log.txt"

# Create a cache directories
mkdir -p cache/pyannote
mkdir -p cache/summarization

# Make sure all required files can be executed
chmod +x services/extract_audio.sh
chmod +x services/pyannote/pyannote.sh 
chmod +x services/audio_chunks/audio_chunks.sh 
chmod +x services/whisper/whisper.sh 
chmod +x services/combine_asr_rttm/combine_asr_rttm.sh
chmod +x services/summarization/summarization.sh

echo "---"
echo "Extracting audio from video"
echo "---"
SC_RUNTIME=$SC_RUNTIME ./services/extract_audio.sh $JOB_ID "$1" $JOB_ID

echo "---"
echo "Speaker diarization"
echo "---"
SC_RUNTIME=$SC_RUNTIME HF_TOKEN=$HF_TOKEN ./services-cuda/pyannote/pyannote.sh $JOB_ID $JOB_ID

echo "---"
echo "Audio chunks"
echo "---"
SC_RUNTIME=$SC_RUNTIME ./services/audio_chunks/audio_chunks.sh $JOB_ID $JOB_ID

echo "---"
echo "Speech recognition"
echo "---"
SC_RUNTIME=$SC_RUNTIME ./services-cuda/whisper/whisper.sh $JOB_ID $JOB_ID

echo "---"
echo "Combining ASR and RTTM"
echo "---"
SC_RUNTIME=$SC_RUNTIME ./services/combine_asr_rttm/combine_asr_rttm.sh $JOB_ID $JOB_ID

echo "---"
echo "Summarization"
echo "---"
SC_RUNTIME=$SC_RUNTIME ./services-cuda/summarization/summarization.sh $JOB_ID $JOB_ID "$INPUT_FILE_NAME"
