# -*- coding: utf-8 -*-
#!/usr/bin/env python

import os
import json
import argparse


p = argparse.ArgumentParser()
p.add_argument("-u") # 位置引数fooを定義
args = p.parse_args()   # デフォルトでsys.argvを解析
print(args.u)

file_path = args.u+'/'+'progress_'+os.environ['PROJECT_ID']+'.json'

# get_dir = os.getcwd()


def replace_text(file_path):
    try:
        with open(file_path, 'r') as f:
            res = json.load(f)
            model_id = res["response"]["name"].split('/')[-1]
       
        with open(file_path, 'w') as f:
            f.write(model_id)
        print("complete")
    except KeyError:
        print("Please wait while learning ...")
 

with open(file_path, 'r') as f:
    if len(f.readlines()) > 1:
        replace_text(file_path)
    else:
        print("converted")
