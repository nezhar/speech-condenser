FROM nvidia/cuda:11.4.0-base-ubuntu20.04

RUN apt update && apt install -y git wget ffmpeg

RUN pip install git+https://github.com/nezhar/whisper.git 

RUN whisper-download --model base
