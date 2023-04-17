""" In case of probes, several probes can be mapped to one gene.
    This code calculates the mean expression of probes that map to the same gene.
    It then writes the new dataset into a csv, where you can remove the duplicated row.""""

import pandas as pd

annotated_exp = pd.read_csv("probes_symbols_expression.csv", sep =";")
annotated_exp.head()
annotated_exp.info()

d = {}

gene_names = annotated_exp["GeneName"].unique()
dict_genes = {k: [] for k in gene_names}


for i in range(len(annotated_exp)):
    dict_genes[annotated_exp["GeneName"].loc[i]].append(i)

for key, value in dict_genes.items():
    dict_genes[key] = annotated_exp.iloc[:,:-2].loc[value].mean(axis = 0) # range of index might change depending on your dataframe

df = pd.DataFrame(dict_genes)
df_t = df.transpose()
df_t.head()
df_t.to_csv("mean_expression.csv", sep = ";")
