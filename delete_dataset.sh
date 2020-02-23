#!/bin/sh

DATA=`cat $1/dataset_id_$PROJECT_ID.txt`


while read line
do
    echo $line
    command14="python automl_vision_dataset.py delete_dataset $line"

done << FILE
$DATA
FILE

# 実行
eval $command14





