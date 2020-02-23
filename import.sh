#!/bin/sh

# if [ ! -e '$USER_NAME' ]; then
#     mkdir '$USER_NAME'
# fi
if [ ! -e $1 ]; then
    mkdir $1
fi


echo $1  # user_folder
echo $2  # dataset01

command0="sudo pip install google-cloud-automl" 
# command1_1="gcloud auth login"
# command1_2="gcloud auth application-default login"
# command1_3="gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS"
command2="gcloud config set project $PROJECT_ID"
command3="gcloud projects add-iam-policy-binding $PROJECT_ID --member=serviceAccount:$SERVICE_ACCOUNT --role='roles/automl.editor'"
command4="gsutil mb -p $PROJECT_ID -c regional -l $REGION_NAME gs://$PROJECT_ID-vcm/"
# command5="gsutil -m cp -R img/saitama/  gs://$PROJECT_ID-vcm/img/saitama/"
command5="gsutil -m cp -R img/$1/*  gs://$PROJECT_ID-vcm/img/$1/"
command6="gsutil -m cp img/$1/all_data.csv  gs://$PROJECT_ID-vcm/csv/all_data.csv"
command7="gsutil cat gs://$PROJECT_ID-vcm/csv/all_data.csv | sed 's:cloud-ml-data:$PROJECT_ID-vcm:' > all_data.csv"
command8="gsutil cp all_data.csv gs://$PROJECT_ID-vcm/csv/"
command9="python automl_vision_dataset.py create_dataset '$2' 'False' -u $1"

# 実行
eval $command0
# eval $command1
eval $command2
eval $command3 
if [ ! -e $1 ]; then
    mkdir $1
fi
eval $command4
eval $command5
eval $command6
eval $command7
eval $command8
eval $command9
