### **Mouse data**: (reference genome) GRCm38.p6, (strain type) C57BL/6J

Normal 1 year tissue from DEN-treated mouse (MD5693, MD5694 and MD5695) can be found here: PMID: [32424351](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7116672/)

Normal 10 days tissue, tumorous 10 days tissue, and tumorous 1 year tissue from DEN-treated mouse can be found: PMID: [34646013](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7612642/)

### **Precomputed reference file** (RefCDS object) was created based on dndscv tutorial:
* [RefCDS building tutorial](http://htmlpreview.github.io/?http://github.com/im3sanger/dndscv/blob/master/vignettes/buildref.html)
* [Archived biomart for GRCm38.p6 genome](http://nov2020.archive.ensembl.org/biomart/martview/c1650624993ec75992204dfcd372fe53)
* [Genome assembly for GRCm38.p6 genome](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001635.26/)
* [Further Ensembl archives](https://www.ensembl.org/info/website/archives/index.html)
* The following R libraries, and functions were used
  * dndscv::buildref


### **Covariates matrice** (not applicable for number of genes < 500):
* [Covariates matrice generation tutorial](https://townsend-lab-yale.github.io/cancereffectsizeR/articles/create_custom_covariates.html)
* Covariate matrice was created from whole esophagus transcriptional profile
  * Excluding knockout mouses, and including wild type mouses in different developmental stages (e.g. embryonic, adult) 
* GEO Accession ID: [GSE34278](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi)
  * Including knockouts and wild type as well
* The following R libraries, and functions were used
  * factoextra, missMDA, FactoMineR

