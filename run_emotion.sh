#!/bin/bash
start_time=$(date +%s)
gpu=0
dataset=emotion
DATA_DIR=/your_path/FastClass/data/emotion/
Sen_DIR=/your_path/FastClass/SentenceTransformer/
labels=10

CUDA_VISIBLE_DEVICES=${gpu} python3 SentenceTransformer/Task_data.py --task ${dataset} --path ${DATA_DIR}
CUDA_VISIBLE_DEVICES=${gpu} python3 SentenceTransformer/Task_external_data.py --task ${dataset} --path ${DATA_DIR} --model_path ${Sen_DIR}
CUDA_VISIBLE_DEVICES=${gpu} python3 SentenceTransformer/SubmodularSelection_Mix.py --task ${dataset} --path ${DATA_DIR}

CUDA_VISIBLE_DEVICES=${gpu}  python3 -u Select_N_K2.py --num_labels ${labels}\
            --train_path  ${DATA_DIR}\
            --metrics 'F1'\
            --test_corpus  ${DATA_DIR}test.txt

end_time=$(date +%s)
cost_time=$[ $end_time-$start_time ]
echo "Total time : $(($cost_time/60))min $(($cost_time%60))s"
