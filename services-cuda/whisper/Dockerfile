FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

RUN apt update && apt install -y python3-pip git wget ffmpeg

RUN pip install git+https://github.com/nezhar/whisper.git 

RUN whisper-download --model base
