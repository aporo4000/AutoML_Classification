#!/bin/sh

# python replace.py

### DATA=`cat $USER_NAME/progress_$PROJECT_ID.json`
DATA=`cat $1/progress_$PROJECT_ID.json`


while read line
do
    echo $line
    echo $1
    echo $2
    # command12="python automl_vision_predict.py predict $line $2 '0.7'"
    # command12="python automl_vision_predict_1030.py predict $line $2 '0.7'"
    command12="python automl_vision_predict.py predict -u $1 $line $2 '0.5'"

done << FILE
$DATA
FILE

# 実行
eval $command12
