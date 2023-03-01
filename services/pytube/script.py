import argparse
from pytube import YouTube


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--youtube_url')
    args = parser.parse_args()
        
    yt = YouTube(args.youtube_url)
    yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first().download(
        output_path='/data/input/', filename='input.mp4'
    )
