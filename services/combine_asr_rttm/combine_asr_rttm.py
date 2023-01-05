import argparse
import json


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    args = parser.parse_args()

    data = []
    dialog_text = ''
    with open('/data/tmp/{}/rttm/{}.rttm'.format(args.uuid, args.file_name)) as f:
        for i, _ in enumerate(f):

            asr_file = open('/data/tmp/{}/asr/{}_{}.wav.txt'.format(args.uuid, args.file_name, i), 'r')
            asr_file_text = asr_file.read().replace('\n', ' ') 

            data.append({
                'start': float(_.split()[3]),
                'duration': float(_.split()[4]),
                'speaker': _.split()[7],
                'text': asr_file_text
            })
            dialog_text += format("{}: {}\n".format(_.split()[7], asr_file_text))

            asr_file.close()


    with open('/data/tmp/{}/asr_rttm_combined/{}.json'.format(args.uuid, args.file_name), 'w') as f:
        json.dump(data, f, indent=4)

    with open('/data/tmp/{}/asr_rttm_combined/{}.txt'.format(args.uuid, args.file_name), 'w') as f:
        f.write(dialog_text)
