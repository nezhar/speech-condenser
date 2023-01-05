import argparse
import torch
from transformers import BertTokenizerFast, EncoderDecoderModel
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--uuid')
    parser.add_argument('--file_name')
    args = parser.parse_args()

    with open('/data/tmp/{}/asr_rttm_combined/{}.txt'.format(args.uuid, args.file_name)) as f:
        # conversation = f.read()

        device = 'cuda' if torch.cuda.is_available() else 'cpu'
        ckpt = 'mrm8488/bert2bert_shared-german-finetuned-summarization'
        tokenizer = BertTokenizerFast.from_pretrained(ckpt)
        model = EncoderDecoderModel.from_pretrained(ckpt).to(device)

        tokenizer = AutoTokenizer.from_pretrained("Einmalumdiewelt/BART_large_CNN_GNAD")
        model = AutoModelForSeq2SeqLM.from_pretrained("Einmalumdiewelt/BART_large_CNN_GNAD")

        count = 0
        conversation = ""
        for line in f:
            if count % 10 == 0:
                inputs = tokenizer([conversation], padding="max_length", truncation=True, max_length=512, return_tensors="pt")
                input_ids = inputs.input_ids.to(device)
                attention_mask = inputs.attention_mask.to(device)
                output = model.generate(input_ids, attention_mask=attention_mask)

                print(tokenizer.decode(output[0], skip_special_tokens=True))
                conversation = ""
            count += 1
            conversation += line

        if count > 0:
            inputs = tokenizer([conversation], padding="max_length", truncation=True, max_length=512, return_tensors="pt")
            input_ids = inputs.input_ids.to(device)
            attention_mask = inputs.attention_mask.to(device)
            output = model.generate(input_ids, attention_mask=attention_mask)

            print(tokenizer.decode(output[0], skip_special_tokens=True))
