#!/bin/bash

podman build -t sc-pytube:0.0.1 ./services/pytube/
podman build -t sc-pyannote:0.0.1 ./services/pyannote/
podman build -t sc-audiochunks:0.0.1 ./services/audio_chunks/
podman build -t sc-whisper:0.0.1 ./services/whisper/
podman build -t sc-combine_asr_rttm:0.0.1 ./services/combine_asr_rttm/
podman build -t sc-summarization:0.0.1 ./services/summarization/
