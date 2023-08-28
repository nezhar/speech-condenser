#!/bin/bash
if [ -z "$SC_RUNTIME" ]
then
  SC_RUNTIME="docker"
fi

$SC_RUNTIME build -t sc-pytube:0.0.1 ./services/pytube/
$SC_RUNTIME build -t sc-audiochunks:0.0.1 ./services/audio_chunks/
$SC_RUNTIME build -t sc-combine_asr_rttm:0.0.1 ./services/combine_asr_rttm/

$SC_RUNTIME build -t sc-pyannote:0.0.1 ./services/pyannote/
$SC_RUNTIME build -t sc-whisper:0.0.1 ./services/whisper/
$SC_RUNTIME build -t sc-summarization:0.0.1 ./services/summarization/

$SC_RUNTIME build -t sc-pyannote-cuda:0.0.1 ./services-cuda/pyannote/
$SC_RUNTIME build -t sc-whisper-cuda:0.0.1 ./services-cuda/whisper/
$SC_RUNTIME build -t sc-summarization-cuda:0.0.1 ./services-cuda/summarization/
