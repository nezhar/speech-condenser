# Speech Condenser

Speech condenser is a tool for reducing the size of a dialogue.

## Pipeline

![Pipeline](./docs/pipeline.png)

It combines several tools to achieve the goal of reducing the size of a dialogue. Each step of the above pipleine runs inside a container.

Steps:

1. Audio extraction - Extracts the audio from the video file.
2. Speaker diarization - Identifies the speakers in the audio file.
3. Split audio - Splits the audio file into smaller chunks based on the speaker diarization.
4. Speech to text - Transcribes the audio chunks into text.
5. Combine ASR and diarization - Combines the results of the ASR and diarization to get the text for each speaker as a dialogue.
6. Summarization - Summarizes the dialogue.


## Installation

The setup uses docker or podman to run the containers. A set of local scripts are provided to run the pipeline.

* build.sh - Builds the containers.
* pipeline.sh - Runs the pipeline.
* yt-pipeline.sh - Runs the pipeline on a youtube video.

Videos needs to be provided in the `data/input` directory. `yt-pipeline.sh` will use this directory to download to cache the video.
The output will be in the `data/output` directory.

Make sure to create a `.env` based on the `.env.example` file and privide the required values:

* SC_RUNTIME - The runtime to use for the containers. Either `docker` or `podman`.
* HF_TOKEN - The [Hugging Face token](https://huggingface.co/settings/tokens) to use for the summarization step.

Make sure to visit [hf.co/pyannote/speaker-diarization](http://hf.co/pyannote/speaker-diarization) and [hf.co/pyannote/segmentation](https://hf.co/pyannote/segmentation) and accept user conditions. This required in order to be able to run the speaker diarization.

## Usage

Run agains a local video file:

```bash
./pipeline.sh "data/input/video.mp4"
```

Run against a youtube video:

```bash
./yt-pipeline.sh "https://www.youtube.com/watch?v=video_id"
```
