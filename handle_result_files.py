"""Set the path to the folder where the output files are present.
   Only use one folder for one specific output. This script does not help 
   if you saved the files of two different analysis in one folder.
   In the target folder a txt file will be created. You will have to separate them
   with enter."""

import pandas as pd
import os

path = "path_to_results"
filenames = os.listdir(path)

for file in filenames:
    print(file)
    df = pd.read_csv(f'{path}/{file}', sep = ",")
    sub_dependent = df[df["classification"] != "independence"]

    if sub_dependent.shape[0] != 0:
        with open(f'{path}/res.txt', "a") as text:
            for ind in sub_dependent.index:
                line = f'{file} has {sub_dependent["classification"][ind]} with {sub_dependent["gene_name"][ind]}'
                text.write(line)
        text.close()

