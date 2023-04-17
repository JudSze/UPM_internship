""" This is just a chaotic script, but can help you in finding the common subset of genes
    in three datasets. It can be useful for gene annotation. """

import pandas as pd
import numpy as np

# Read in datatable, retrieved from Ensembl biomart, that contains the gene symbols, and other annotations
mart_ann = pd.read_csv("mart_annotation.csv", sep = ";")
mart_ann.head()
mart_ann.columns #'Gene stable ID','Gene_name' should be present in the dataset

# Read in dataset, created by mean_exp.py, where you already removed duplicated rows
mean_exp = pd.read_csv("mean_expression.csv", sep = ";")
mean_exp.head()
mean_exp.columns  #'Unnamed: 0'
mean_exp.info # note the dimension of the dataframe
mean_exp_genes = mean_exp["Gene_name"]

# Read in the genes, that are present in the reference matrice
ref = pd.read_csv("ref_matrice.csv", sep = ";")
ref_genes = ref[["Gene stable ID", "Gene name"]].drop_duplicates()
ref_genes_list = ref["Gene name"].unique()
ref_genes.info # note the dimension of the dataframe

gene_ensembl = mart_ann[["Gene stable ID", "Gene name"]].drop_duplicates()

merged = mean_exp.merge(gene_ensembl, on = "Gene name")
merged.info

merged.to_csv("extended_mean_expression.csv", sep = ";")

merged_ref_cov_ann = mean_exp.merge(ref_genes, on = "Gene name")
merged_ref_cov_ann.info

#Merged reference, covariance, annotated mean expression covariance table
merged_ref_cov_ann.to_csv("C:/Coselens/mouse/mouse_eso_research/covariance_table/sub_extended_mean_expression.csv", sep = ";")

"""Extend covariance table with missing genes"""
ref_genes = pd.read_csv("C:/Coselens/mouse/mouse_eso_research/covariance_table/refcds_genes.csv", sep = ";")
len(ref_genes)

common = mean_exp.merge(ref_genes,on=["Gene_name"])

missing = []

common_list = list(common["Gene_name"])
uniq_mart_ann_list = list(ref_genes_list)


res = [ele for ele in uniq_mart_ann_list]

for gene in common_list:
    if gene in res:
        res.remove(gene)

missing = pd.DataFrame(columns=common.columns)
missing["Gene_name"] = res

com_missing = pd.concat([common, missing])
try_com_missing = com_missing.set_index("Gene_name" ,inplace=True)
try_refgenes = ref_genes.set_index("Gene_name", inplace = True)

try_com_missing.to_csv("try_com_missing.csv", sep = ";")
com_missing.fillna('', inplace=True)


dif = set.difference(set(com_missing.index) ,set(ref_genes.index))

res = com_missing.drop(dif, axis = 0)
res.to_csv("try_filled.csv", sep = ";")

gene_names = pd.read_csv("refcds_genes.csv", sep = ";")

merged_res = gene_names.merge(res, on = "Gene_name")
merged_res.to_csv("covariance_table.csv", sep = ";")

full = pd.read_csv("full_coselens_input_dataset.csv", sep =";")
genes = list(full["gene"])

dict_genes = {k: [] for k in genes}

for gene in genes:
    dict_genes[gene] = genes.count(gene)

max(dict_genes, key=dict_genes.get)
