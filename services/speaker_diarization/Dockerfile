FROM python:3.10-slim

RUN pip install pyannote.audio
RUN apt update && apt install -y libsndfile1
COPY speaker_diarization.py /src/speaker_diarization.py
