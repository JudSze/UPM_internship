import pandas as pd
import numpy as np
import uuid

n1y = pd.read_csv("merged_samples_coselens_input_dataset.csv", sep = ";")
n1y.head()

# convert merged ids to list datatype
def clean_alt_list(list_):
    list_ = list_.replace(', ', '","')
    list_ = list_.replace('[', '["')
    list_ = list_.replace(']', '"]')
    return list_

n1y["merged_id"] = n1y["merged_id"].apply(clean_alt_list)
n1y['merged_id'].iloc[1]

n1y["merged_id"] = n1y["merged_id"].apply(eval)

for i, l in enumerate(n1y["merged_id"]):
 print("list",i,"is",type(l))

# multiple rows of merged ids by the number of ids that were merged
ind_n1y = n1y.set_index("sample_id")
for i in range(len(n1y)):
   l = n1y["merged_id"].iloc[i]
   if len(l) > 1:
      for e in range(len(l)):
        ind_n1y.loc[f'{uuid.uuid1()}_{l[e]}'] = n1y.iloc[i]


ind_n1y.to_csv("opened_coselens_input_dataset.csv", sep = ";")
