FROM python:3.10-slim

RUN apt update && apt install -y git wget ffmpeg

RUN pip install git+https://github.com/nezhar/whisper.git 

RUN whisper-download --model base
