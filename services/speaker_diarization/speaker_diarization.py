import sys
import argparse
from pyannote.audio import Pipeline


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    parser.add_argument('--hf_token')
    args = parser.parse_args()

    pipeline = Pipeline.from_pretrained("pyannote/speaker-diarization", use_auth_token=args.hf_token, batch_size=8)
    diarization = pipeline("/data/tmp/{}/wav/{}.wav".format(args.uuid, args.file_name))

    with open("/data/tmp/{}/rttm/{}.rttm".format(args.uuid, args.file_name), "w") as rttm:
        diarization.write_rttm(rttm)
