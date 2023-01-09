FROM nvidia/cuda:11.4.0-base-ubuntu20.04
#11.8.0-base-ubuntu22.04

RUN apt update && apt install -y python3-pip
RUN pip install pyannote.audio
RUN apt update && apt install -y libsndfile1
COPY speaker_diarization.py /src/speaker_diarization.py
