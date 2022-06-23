#!/bin/bash
start_time=$(date +%s)
gpu=0
dataset=yelp
DATA_DIR=/root/autodl-tmp/CLARET/data/GD/yelp/
Sen_DIR=/root/autodl-tmp/CLARET/SentenceTransformer/
labels=2

CUDA_VISIBLE_DEVICES=${gpu}  python3 -u Select_N_K2.py --num_labels ${labels}\
            --train_path  ${DATA_DIR}\
            --test_corpus  ${DATA_DIR}test.txt

end_time=$(date +%s)
cost_time=$[ $end_time-$start_time ]
echo "Total time : $(($cost_time/60))min $(($cost_time%60))s"
