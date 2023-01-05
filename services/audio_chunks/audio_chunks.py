import argparse
from pydub import AudioSegment


def millisec(time):
  return time * 1000


def extract_timestamps(filename):
  timestamps = []
  with open(filename, 'r') as f:
    lines = f.readlines()
    for line in lines:
      elements = line.split()
      start_time = float(elements[3])
      duration = float(elements[4])
      timestamps.append((millisec(start_time), millisec(start_time + duration)))
  return timestamps


def split_wav_file(filename, timestamps, args):
    audio = AudioSegment.from_wav(filename)

    for i, (start_time, end_time) in enumerate(timestamps):
        audio_chunk=audio[start_time:end_time]
        audio_chunk.export(f'/data/tmp/{args.uuid}/chunks/{args.file_name}_{i}.wav'.format(i), format="wav")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    args = parser.parse_args()

    timestamps = extract_timestamps("/data/tmp/{}/rttm/{}.rttm".format(args.uuid, args.file_name))
    split_wav_file("/data/tmp/{}/wav/{}.wav".format(args.uuid, args.file_name), timestamps, args)
