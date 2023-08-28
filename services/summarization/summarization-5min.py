import argparse
import datetime
import json
from transformers import pipeline


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    args = parser.parse_args()

    conversation = ""
    summary = ""
    summarizer = pipeline("summarization", model="lidiya/bart-large-xsum-samsum")

    with open('/data/tmp/{}/asr_rttm_combined/{}.json'.format(args.uuid, args.file_name)) as f:
        data = json.load(f)
        start_time = str(datetime.timedelta(seconds=data[0]['start'] // 1))

        i = 1;
        for item in data:
            if item['start'] > i * 60 * 5:
                print(item['start'])
                result = summarizer(conversation, truncation=True)
                summary += start_time + " - " + result[0]['summary_text'] + "\n"
                conversation = ""
                i += 1
                start_time = str(datetime.timedelta(seconds=(item['start'] + item['duration']) // 1))

            conversation += item['speaker'] + ": " + item['text'] + "\n"

    if conversation:
        result = summarizer(conversation, truncation=True)
        summary += start_time + " - " + result[0]['summary_text'] + "\n"

    with open('/data/output/{}.txt'.format(args.uuid), 'w') as f:
        f.write(summary)
