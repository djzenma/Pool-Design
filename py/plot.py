import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
ax = fig.gca(projection='3d')

points = [(0,0,1.5),(1,0,1.2),(2,0,2.2),(0,0.5,1.5),(1,0.5,1.5),(2,0.5,1.75),(0,1,1.8),(1,1,1.7),(2,1,1.9)]
xp = []
yp = []
zp = []
for x,y,z in points:
	xp.append(x)
	yp.append(y)
	zp.append(z)
xp = np.array(xp)
yp = np.array(yp)
zp = np.array([zp])

surf = ax.scatter3D(xp, yp, zp)

plt.show()