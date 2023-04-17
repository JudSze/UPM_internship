# Remove consecutive mutations
# This code is created by im3sanger: https://github.com/im3sanger/dndscv/issues/7

mutations = mutations[order(mutations$sampleID,mutations$chr,mutations$pos),]
ind = which(diff(mutations$pos)==1)

# You can manually remove these, or drop those rows in R
mutations[unique(sort(c(ind,ind+1))),]
