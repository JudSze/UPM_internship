import pandas as pd

# Columns in this order: chromosome, sample ID, position, reference genome, mutation, 
d10_normal = pd.read_csv("input_data.csv", sep = ";") 

#remove last column vaf
d10_normal.head()
d10_normal.info # note the dimension of the dataset at the beginning

# Super safe dataset
# Remove samples with mutations, that are in the same mouse, and are suspiciously similar
# It can also be because of policlonality
cleared_d10_normal = d10_normal.drop_duplicates(subset= ["mouse","pos","ref","mut","gene","ntchange","aachange","impact"],keep="first")
cleared_d10_normal.info # note the dimension of the cleared dataset ó


cleared_d10_normal.to_csv("cleared_input_data.csv", sep = ";")
