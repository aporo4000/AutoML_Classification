#!/bin/sh

# DATA=`cat $USER_NAME/dataset_id_$PROJECT_ID.txt`
DATA=`cat $1/dataset_id_$PROJECT_ID.txt`


while read line
do
    echo $line 
    command10="python automl_vision_dataset.py import_data $line 'gs://$PROJECT_ID-vcm/img/$1/all_data.csv'"
    echo "imported"
    # 以下、第4引数のバジェット数1にすれば$1で収まる予定
    ### command11="python automl_vision_model.py create_model $line 'flowers_model' '1'"
    echo $1  
    echo $2   
    command11="python automl_vision_model.py create_model -u $1 $line $2 '1'"
    # command11="python automl_vision_model.py create_model $line $1 '1'"
done << FILE
$DATA
FILE


# 実行
eval $command10
eval $command11
