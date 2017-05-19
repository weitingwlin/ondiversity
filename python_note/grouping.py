import numpy as np
import pandas as pd
from sortData import sorting


def grouping(df = None, numGroup = 3, indexGroup = None, groupName = 'Section', cr = None):
    
    if df is None:
        df = sorting()
    
    unq = 0
    if indexGroup != None:
        unq = df[indexGroup].unique()


    if (indexGroup == None or len(unq) == 1):
        l = list(np.arange(1,numGroup+1,1))
        df[groupName] = ctile(l, len(df))
        return df

    else:
        df2 = pd.DataFrame()
        for i in unq:
            ddf = df.loc[df[indexGroup]==i]
            ddf = sorting(ddf, cr)
            df2 = df2.append(grouping(ddf, numGroup, None, groupName)) 
        return df2
    

def ctile(l,length):
    rint = int(length/len(l))
    rest = length%len(l)
    result = list(np.tile(l,rint)) + l[:rest]
    return result