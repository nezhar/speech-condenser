import os
import argparse
from pytube import YouTube


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--youtube_url')
    parser.add_argument('--output_path', default='data/input/')
    args = parser.parse_args()

    print("Downloading video from {} to {}".format(args.youtube_url, args.output_path))
    yt = YouTube(args.youtube_url)
    yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first().download(
        output_path=os.path.join("/", args.output_path)
    )
