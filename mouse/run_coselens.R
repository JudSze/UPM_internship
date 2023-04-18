library(coselens)
library(readxl)
library(glue)

setwd("your_path")

# tumorous samples
t_10d = read.csv("Targeted_seq_isolated_tumors_10d_postDEN_mouse_EE.csv", sep =";")
t_1y = read.csv("Targeted_seq_isolated_tumors_1y_postDEN_mouse_EE.csv", sep = ";")

# normal samples
n_10d = read.csv("Targeted_seq_normal_10d_postDEN_mice_EE.csv", sep = ";")
n_1y = read.csv("normal_1_year.csv", sep = ";")

multiple_coselens = function(ctrl, test){
  ctrl_name = deparse(substitute(ctrl))
  test_name = deparse(substitute(test))
  file_name = glue("{ctrl_name}_VS_{test_name}_log.txt")

  common_genes = merge(ctrl, test, by = "gene")
  seq_genes = unique(common_genes$gene)
  
  ctrl = ctrl[,c("sampleID","chr","pos","ref","mut")]
  test = test[,c("sampleID","chr","pos","ref","mut")]
  
  file.create(file_name)
  msgcon = file(file_name, open = "a")
  sink(msgcon, type = "message")
  coselens_out = coselens(ctrl, test, sequenced.genes = seq_genes, cv = NULL, refdb = "your_path/mouse_GRCm38.p6.rda")
  sink()
  
  write.csv(coselens_out$substitutions, glue("{ctrl_name}_VS_{test_name}.csv"))
}

multiple_coselens(n_10d, n_1y)


