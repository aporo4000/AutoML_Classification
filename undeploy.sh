#!/bin/sh


echo $1  
 
# アンデプロイ
python undeploy.py -u $1
