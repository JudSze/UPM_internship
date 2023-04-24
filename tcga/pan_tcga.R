# devtools::install_github("ggruenhagen3/coselens")
# devtools::install_github("im3sanger/dndscv")

library(coselens)
library(glue)

setwd("C:/Coselens/TCGA")

data("cancer_genes", package = "coselens")

germline_muts = read.table("TCGA.SIM.long.ID.exonic.filter1_2.CPG.CANCERS.ORDER.tsv", sep = "\t", header = TRUE)

somatic_muts = read.table("TCGA_mc3_reannotated_noHyperMut3000_MNVgood.txt", sep = "", dec = ".")
colnames(somatic_muts) = c("mutation_id", "SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt", "Gene", "ann_1", "ann_2", "IMPACT", "ann_3", "ann_4", "CANCER")

split_genes = unique(germline_muts$Gene.ensGene)

for (split_gene in split_genes){
  print("for loop entered for split gene")
  
  test_samples = dplyr::filter(germline_muts, Gene.ensGene == split_gene & (IMPACT == "HIGH" | IMPACT == "MODERATE"))
  test_sample_list = c(unique(test_samples$SAMPLE_ID_ONLY))
  ctrl_samples = c(setdiff(unique(germline_muts$SAMPLE_ID_ONLY), unique(test_samples$SAMPLE_ID_ONLY)))
 
  if (length(unique(test_samples$SAMPLE_ID_ONLY)) >= 25 & length(unique(ctrl_samples)) >= 25){
    print("filtering ctrl and test")
    
    test_filt = dplyr::filter(somatic_muts, (SAMPLE_ID_ONLY  %in% test_sample_list))
    ctrl_filt = dplyr::filter(somatic_muts, (SAMPLE_ID_ONLY  %in% ctrl_samples))
    

    print("passed into coselens phase")
    test = test_filt[,c("SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt")]
    ctrl = ctrl_filt[,c("SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt")]
      
    print("starting coselens phase")
    file_name = glue("pan_{split_gene}_log.txt")
    file.create(file_name)
    msgcon = file(file_name, open = "a")
    sink(msgcon, type = "message")
    coselens_out = coselens(ctrl,test, subset.genes.by = cancer_genes)
    write.csv(coselens_out$substitutions, glue("pan_tcga/pan_{split_gene}.csv"))
    sink()}else{
      print("something with the dimensions")}
}


