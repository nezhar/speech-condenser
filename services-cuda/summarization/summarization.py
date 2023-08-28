import argparse
from transformers import pipeline


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    args = parser.parse_args()

    with open('/data/tmp/{}/asr_rttm_combined/{}.txt'.format(args.uuid, args.file_name)) as f:
        conversation = f.read()

        summarizer = pipeline("summarization", model="philschmid/bart-large-cnn-samsum")
        result = summarizer(conversation, truncation=True)

    with open('/data/output/{}.txt'.format(args.uuid), 'w') as f:
        f.write(result[0]['summary_text'])
