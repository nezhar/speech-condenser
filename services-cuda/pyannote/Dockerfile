FROM nvidia/cuda:11.7.1-devel-ubuntu22.04
#11.8.0-base-ubuntu22.04

RUN apt update && apt install -y python3-pip
RUN pip install --upgrade pip setuptools
RUN pip install pyannote.audio
RUN apt update && apt install -y libsndfile1
COPY pyannote.py /src/pyannote.py
