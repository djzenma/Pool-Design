import numpy as np
import matplotlib.pyplot as plt
import sympy as sy

def bicubic(x,y,z,xt):
	x = np.array(x)
	y = np.array(y)
	z = np.array(z)
	for i in range(4):
		for j in range(4):
			
	
points = [(0,0,1.5),(1,0,1.2),(2,0,2.2),(0,0.5,1.5),(1,0.5,1.5),(2,0.5,1.75),(0,1,1.8),(1,1,1.7),(2,1,1.9)]
xp = []
yp = []
zp = []
for x,y,z in points:
	xp.append(x)
	yp.append(y)
	zp.append(z)

# p(0,0) = a00	p(0,1) = 
#
#
#