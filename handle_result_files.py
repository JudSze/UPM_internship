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

