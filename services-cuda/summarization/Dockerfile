FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

RUN apt update && apt install -y python3-pip
RUN pip install transformers torch
COPY summarization.py /src/summarization.py
COPY summarization-5min.py /src/summarization-5min.py
