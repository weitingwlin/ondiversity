'''
 This file will import and clenup the data
'''

import pandas as pd

def dataCleanUp(df = None):
    
    # Import data
    if df is None:
        file_name = "/Users/Robin/Documents/GitHub/ondiversity/Data/data_public1.csv"
        df = pd.read_csv(file_name)
    
    # Delete column contains only "NaN"
    cleaned_data = df.dropna(axis = 1, how = "all")
    
    # Delete row when EmplID = NaN
    cleaned_data = cleaned_data[cleaned_data["EmplID"].notnull()]
    return df;