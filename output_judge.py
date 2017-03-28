# -*- coding: utf-8 -*-
"""
Created on Tue Mar 28 15:57:12 2017

@author: Chikuwa
"""

import pandas as pd
import numpy as np
import difflib, sys
from os import listdir
from os.path import isfile, join

def non_sp_char(target_str):
    target_str = target_str.replace('\n','')
    target_str = target_str.replace(' ','')
    return target_str

def main(path, real, output_name):
    with open(real, 'r') as myfile:
        output_real = myfile.read()

    path_files = [f for f in listdir(path) if isfile(join(path, f))]
    result = []
    
    print('Processing...')
    for file in path_files:
        if file[-3:] != 'txt':
            continue
        with open(path+'\\'+file, 'r') as myfile:
            output_test = myfile.read()
        if difflib.SequenceMatcher(None,output_test,output_real).ratio() == 1:
            result.append([file, 'AC'])
        else:
            output_real_nonsp = non_sp_char(output_real)
            output_test_nonsp = non_sp_char(output_test)
            if difflib.SequenceMatcher(None,output_test_nonsp.lower(),output_real_nonsp.lower()).ratio() == 1:
                result.append([file, 'PE'])
            else:
                result.append([file, 'WA'])
    print('Done...')
    return pd.DataFrame(result, columns = ['file', 'type']).to_csv('%s.csv' %output_name, index = 0, header = 0)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])