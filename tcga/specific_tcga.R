
# devtools::install_github("ggruenhagen3/coselens")
# devtools::install_github("im3sanger/dndscv")

library(coselens)
library(glue)

data("cancer_genes", package = "coselens")

setwd("../../data/iranzo/TCGA")

germline_muts = read.table("TCGA.SIM.long.ID.exonic.filter1_2.CPG.CANCERS.ORDER.tsv", sep = "\t", header = TRUE)

somatic_muts = read.table("TCGA_mc3_reannotated_noHyperMut3000_MNVgood.txt", sep = "", dec = ".")
colnames(somatic_muts) = c("mutation_id", "SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt", "Gene", "ann_1", "ann_2", "IMPACT", "ann_3", "ann_4", "CANCER")

split_genes = unique(germline_muts$Gene.ensGene)[11:150]
print(length(split_genes))

# FOR EACH CANCER TYPE
cancer_types = unique(germline_muts$CANCER)[4:32]
print(length(cancer_types))

for (type in cancer_types){
  print("for loop for cancer types entered")
  for (split_gene in split_genes){
    print("for loop  for genes entered")
    filt_germline_muts = dplyr::filter(germline_muts, CANCER == type)

    test_samples = dplyr::filter(filt_germline_muts, Gene.ensGene == split_gene & (IMPACT == "HIGH" | IMPACT == "MODERATE"))
    test_sample_list = c(unique(test_samples$SAMPLE_ID_ONLY))
    ctrl_samples = c(setdiff(unique(filt_germline_muts$SAMPLE_ID_ONLY), unique(test_samples$SAMPLE_ID_ONLY)))

    if (length(unique(test_samples$SAMPLE_ID_ONLY)) >= 25 & length(unique(ctrl_samples)) >= 25){

      test_filt = dplyr::filter(somatic_muts, (SAMPLE_ID_ONLY  %in% test_sample_list))
      ctrl_filt = dplyr::filter(somatic_muts, (SAMPLE_ID_ONLY  %in% ctrl_samples))

      print("passed into coselens phase")

      ctrl = test_filt[,c("SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt")]
      test = ctrl_filt[,c("SAMPLE_ID_ONLY", "som_Chr", "som_POS", "som_Ref", "som_Alt")]

      print("entering coselens phase")
      file_name = glue("{type}_{split_gene}_log.txt")
      file.create(file_name)
      msgcon = file(file_name, open = "a")
      sink(msgcon, type = "message")
      coselens_out = coselens(ctrl, test, subset.genes.by = cancer_genes)
      write.csv(coselens_out$substitutions, glue("specific_cancer_types/{type}_{split_gene}.csv"))
      sink()}else{
          print("something with the dimensions")}

    }
}
