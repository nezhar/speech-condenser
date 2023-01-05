#!/bin/bash
set -o errexit

INPUT_FILE=$1
HF_TOKEN=$2

JOB_ID=${INPUT_FILE%.*}
INPUT_FILE_NAME=${INPUT_FILE%.*}

# Create a temporary directories for the job
echo "Job ID: $JOB_ID"
rm -rf data/tmp/$JOB_ID
mkdir -p data/tmp/$JOB_ID/wav
mkdir -p data/tmp/$JOB_ID/rttm
mkdir -p data/tmp/$JOB_ID/chunks
mkdir -p data/tmp/$JOB_ID/asr
mkdir -p data/tmp/$JOB_ID/asr_rttm_combined

# Make sure all required files can be executed
chmod +x services/extract_audio.sh
chmod +x services/speaker_diarization/speaker_diarization.sh 
chmod +x services/audio_chunks/audio_chunks.sh 
chmod +x services/whisper/whisper.sh 
chmod +x services/combine_asr_rttm/combine_asr_rttm.sh
chmod +x services/summarization/summarization.sh

# Extract audio from video
./services/extract_audio.sh $JOB_ID $INPUT_FILE

# Spekaer diarization
./services/speaker_diarization/speaker_diarization.sh $JOB_ID $INPUT_FILE_NAME $HF_TOKEN

# Audio chunks
./services/audio_chunks/audio_chunks.sh $JOB_ID $INPUT_FILE_NAME

# Speach recognition
./services/whisper/whisper.sh $JOB_ID $INPUT_FILE_NAME

# Combine ASR results
./services/combine_asr_rttm/combine_asr_rttm.sh $JOB_ID $INPUT_FILE_NAME

# Summarization
./services/summarization/summarization.sh $JOB_ID $INPUT_FILE_NAME
