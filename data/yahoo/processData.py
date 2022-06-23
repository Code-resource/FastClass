
from random import sample
import os


labels = []
with open('./classes.txt', 'r') as f:
    for line in f.readlines():
        labels.append(line.strip().replace('&', 'and'))

fn = open('./classes.txt', 'w', encoding='utf-8')
for word in labels:
    fn.write(word+'\n')
print(labels)


data = {}
with open('OriginalData/train_pu_half_v0.txt', 'r', encoding='utf-8') as f:
    for line in f.readlines():
        label, doc = line.strip().split('\t')
        if label not in data.keys():
            data[label] = [doc]
        else:
            data[label].append(doc)

with open('OriginalData/train_pu_half_v1.txt', 'r', encoding='utf-8') as f:
    for line in f.readlines():
        label, doc = line.strip().split('\t')
        if label not in data.keys():
            data[label] = [doc]
        else:
            data[label].append(doc)



# for j in [150]:
fw = open('./train.txt', 'w', encoding='utf-8')
for k in data.keys():
    for doc in data[k]:
        fw.write('{}\t{}\n'.format(str(k), doc))


