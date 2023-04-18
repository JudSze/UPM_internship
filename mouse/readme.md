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

### Description of datasets (accessible on the cluster)
* 41586_2021_3965_MOESM4_ESM.xlsx
  * 10 days normal tissue, 10 days tumorous tissue, 1 year tumorous tissue of post DEN-treated mouses (targeted sequencing)
  * 9 months and 18 month neoplasm tissue of post DEN-treated mouse (whole genome sequencing)
  * dndscv input tables (the same that can be used for Coselens)
  * results of dndscv for each table
  * HGFP intensity data
  ```diff
  + Targeted_seq_normal_10d_postDEN_mice_EE.xlsx
  ```
    * targeted sequencing data of 10 days post DEN-treated normal mouse tissue
  ```diff  
  + Targeted_seq_isolated_tumors_10d_postDEN_mouse_EE.xlsx
  ```
    * targeted sequencing data of 10 days post DEN-treated tumorous mouse tissue
  ```diff
  + Targeted_seq_isolated_tumors_1y_postDEN_mouse_EE.xlsx
  ```
    * targeted sequencing data of 1 year post DEN-treated tumorous mouse tissue
  ```diff
  + WES_results_9m_and_18_m_postDEN_tumors.xlsx
  ```
    * whole genome sequencing data of post DEN-treated mouse neoplasms
* 41586_2021_3965_MOESM18_ESM.xlsx
  * supplementary file of experimental data for 41586_2021_3965_MOESM4_ESM.xlsx
* EMS114216-supplement-Supplementary_data.xlsx
  * it contains both human and mouse data
  ```diff
  + EMS114216_control_test.xlsx
  ```
    * it contains targeted sequencing data of normal and tumorous tissue of DEN-treated mouses  

### Description of RefCDS object
* there can be Windows-specific problems that arose, therefore it is worth running buildref in Linux environment
```diff
! GCF_000001635.26_GRCm38.p6_genomic.fna
```
   * reference genome assemply
```diff
- mart_export_GRcm38.p6.txt
```
   * txt file retrieved through biomart
 * mouse_GRCm38.p6.rda
   * RefCDS object created with dndscv::buildref function, from the biomart txt file, and the reference genome assembly

### Description of covariates matrice
* if you are following the tutorial, there can be Windows-specific problems that arose, therefore it is worth running buildref in Linux environment
* first step was excluding the knockout samples from the expression data
* after annotation of probes, and taking the mean of probes mapped to the same gene, the mean expression matrice was used
* missing values (whole rows for genes that were present in the RefCDS object, but not in the expression data) were computed with missMDA::imputePCA
* based on eigenvalues 5 PCA were selected from 15 variables, and saved in csv format
