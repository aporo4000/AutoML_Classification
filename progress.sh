#!/bin/sh

DATA=`cat $1/operation_$PROJECT_ID.txt`


# if [ ! -e '$USER_NAME/progress_$PROJECT_ID.txt' ]; then
#     touch '$USER_NAME/progress_n$PROJECT_ID.txt'
# fi
HEAD=`echo Authorization: Bearer $(gcloud auth application-default print-access-token)`
HEAD1='Content-Type: application/json'
# URL="https://automl.googleapis.com/v1beta1/(operation_name)"
URL="https://automl.googleapis.com/v1beta1/"

while read line
do
    echo $line
    echo $1"/progress_$PROJECT_ID.json"

    ### curl -X GET -H "$HEAD" -H "$HEAD1" $URL$line > $USER_NAME/progress_$PROJECT_ID.json
    curl -X GET -H "$HEAD" -H "$HEAD1" $URL$line > $1/progress_$PROJECT_ID.json


done << FILE
$DATA
FILE

python replace.py -u $1
