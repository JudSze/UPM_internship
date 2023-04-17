import pandas as pd

# Columns in this order: chromosome, sample ID, position, reference genome, mutation, 
coselens_input = pd.read_csv("input_data.csv", sep = ";") 

#remove last column vaf
coselens_input.head()
coselens_input.info # note the dimension of the dataset at the beginning

# Super safe dataset
# Remove samples with mutations, that are in the same mouse, and are suspiciously similar
# It can also be because of policlonality
coselens_input = coselens_input.drop_duplicates(subset= ["mouse","pos","ref","mut","gene","ntchange","aachange","impact"],keep="first")
coselens_input.info # note the dimension of the cleared dataset ó


coselens_input.to_csv("cleared_input_data.csv", sep = ";")
