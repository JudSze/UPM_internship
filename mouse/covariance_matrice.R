library(readxl)
library(factoextra)

expression = read.csv("C:/Coselens/mouse/mouse_eso_research/covariance_table/covariance_table.csv", sep = ";", header = TRUE)
row.names(expression) = expression$Gene_name
expression$Gene_name = NULL
t_expression = t(expression)

#PCA with prcomp
pca <- prcomp(res.comp$completeObs)
fviz_eig(res.pca, addlabels = TRUE, ncp = 24)
fviz_eig(res.pca, geom = "line")

pca_matrice <- as.data.frame(pca$x)
write.csv(pca_matrice, "pca_matrice.csv")

pca$x

getwd()
setwd("C:/Coselens/mouse/mouse_eso_research/covariance_table")
saveRDS(pca, "mean_expression_pca.rds")
head(pca, 2)

fviz_eig(pca, addlabels = TRUE, ncp = 15)

#PCA with missing values
install.packages("missMDA")
install.packages("FactoMineR")

library(missMDA)
library(FactoMineR)

#estimate the number of dimensions for PCA
nb = estim_ncpPCA(expression, method.cv = "Kfold", ncp.min = 0, ncp.max = 15, verbose = FALSE)
nb$ncp #14

plot(0:5, nb$criterion, xlab = "nb dim", ylab = "MSEP")

#compute PCA
res.comp <- imputePCA(expression)
View(res.comp$completeObs)

res.pca <- PCA(res.comp$completeObs, ncp = 15 ,graph=TRUE)

head(res.pca$ind$coord) #scores (principal components)
head(res.pca$svd)

setwd("C:/Coselens/mouse/finalized_results/covariance_tables")
write.csv(res.pca$ind$coord, "15_PCA_cov_table.csv")
write.csv(res.pca$ind$contrib, "15_PCA_contrib_table.csv")

fviz_contrib(res.pca, choice = "var", axes = 5, top = 10)

fviz_eig(res.pca, addlabels = TRUE, ncp = 24)
fviz_eig(res.pca, geom = "line")


