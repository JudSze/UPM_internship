In the data/iranzo/TCGA folder you will find 4 folders:
pan_cancer: running pan cancer analysis with a filter on the cancer genes (from the Coselens publication)
pan_unfilt: running pan cancer analysis with no filter and retrieving the dndscv table, as well as the genes that were <= 0.05 global after BH correction

specific_coselens_subset: running cancer type specific analysis with a filter on the cancer genes (from the Coselens publication)
specific_tcga: running cancer type specific analysis with a filter on cancer genes specific to the cancer type (genes retrieved from the all_cand_split_genes_ex_1.tsv file)
specific_unfilt: running cancer type specific analysis with no filter and retrieving the dndscv table, as well as the genes that were <= 0.05 global after BH correction

The analysis of pan cancer data is completely done. You will find every file in the pan_cancer, and pan_unfilt folders.
The analysis of each cancer type is not complete. The unfiltered analysis is only done for genes with indeces 11-30.
The filtered analysis for cancer genes from Coselens article is done for genes with indexes 11-110.

FILTERED PAN TCGA     
- [X]  1-10               
- [X]  11-20                    
- [X]  21-30                    
- [X]  31-40  
- [X]  41-50 
- [X]  51-60    
- [X]  61-70  
- [X]  71-80
- [X]  81-90
- [X]  91-100
- [X]  101-110
- [X]  111-120
- [X]  121-130
- [X]  131-140
- [X]  141-150

UNFILTERED PAN TCGA     
- [X]  1-10               
- [X]  11-20                    
- [X]  21-30                    
- [X]  31-40  
- [X]  41-50 
- [X]  51-60    
- [X]  61-70  
- [X]  71-80
- [X]  81-90
- [X]  91-100
- [X]  101-110
- [X]  111-120
- [X]  121-130
- [X]  131-140
- [X]  141-150

FILTERED SPECIFIC SPECIFIC TCGA    
- [X]  1-10               
- [X]  11-20                    
- [X]  21-30                    
- [X]  31-40  
- [X]  41-50 
- [X]  51-60    
- [X]  61-70  
- [X]  71-80
- [X]  81-90
- [X]  91-100
- [X]  101-110
- [X]  111-120
- [X]  121-130
- [X]  131-140
- [X]  141-150

FILTERED COSELENS GENES SPECIFIC TCGA    
- [ ]  1-10               
- [X]  11-20                    
- [X]  21-30                    
- [X]  31-40  
- [ ]  41-50 (might be missing some genes)
- [X]  51-60    
- [X]  61-70  
- [X]  71-80
- [X]  81-90
- [X]  91-100
- [X]  101-110
- [ ]  111-120
- [ ]  121-130
- [ ]  131-140
- [ ]  141-150

UNFILTERED SPECIFIC TCGA    
- [ ]  1-10               
- [X]  11-20                    
- [X]  21-30                    
- [ ]  31-40  
- [ ]  41-50 
- [ ]  51-60    
- [ ]  61-70  
- [ ]  71-80
- [ ]  81-90
- [ ]  91-100
- [ ]  101-110
- [ ]  111-120
- [ ]  121-130
- [ ]  131-140
- [ ]  141-150

