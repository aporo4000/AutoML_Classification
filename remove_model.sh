#!/bin/sh

DATA=`cat $1/progress_$PROJECT_ID.json`


while read line
do
    echo $line
    command13="python automl_vision_model.py delete_model $line"

done << FILE
$DATA
FILE


# 実行
eval $command13
