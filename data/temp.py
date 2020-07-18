import csv
import numpy as np


with open("/data/Abdo/Abdo/Abdos University work/Summer 2020/engineering computation/project/Pool-Design/data/pool2.csv", newline='') as f: 
    reader = csv.reader(f) 
    data = np.array(list(reader)) 
data = data.astype(np.float)
data[:,0] -= np.amin(data[:,0])
data[:,1] -= np.amin(data[:,1])
data[:,2] -= np.amin(data[:,2])
data = data[data[:,2].argsort(),]
data = data[data[:,0].argsort(),]
print(data)