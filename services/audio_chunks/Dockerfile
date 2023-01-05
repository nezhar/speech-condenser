FROM python:3.10-slim

RUN apt update && apt install -y ffmpeg
RUN pip install pydub
COPY audio_chunks.py /src/audio_chunks.py
