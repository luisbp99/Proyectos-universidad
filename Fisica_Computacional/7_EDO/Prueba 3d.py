
import numpy as np
import matplotlib.pyplot as plt

# =========== FUNCIONES ===========

def sistEuler(deltat,t,x,y,z,sigma,r,b):
    for i in range(1000):
        deltat = 0.01
        t += deltat
        x += deltat*sigma*(y-x)
        y += deltat*(r*x-y-x*z)
        z += deltat*(x*y-b*z)
        ax3.scatter3D(x,y,z,marker='.')
        ax3.set_xlabel('Eje x')
        ax3.set_ylabel('Eje y')
        ax3.set_zlabel('Eje z')
        ax3.set_title('Euler')
        
def sistRK2(deltat,t,x,y,z,sigma,r,b):
    for i in range(500):
        t += deltat
        k1x = deltat*sigma*(y-x)
        k1y = deltat*(r*x-y-x*z)
        k1z = deltat*(x*y-b*z)
        k2x = deltat*sigma*(y+k1y/2.-x-k1x/2.)
        k2y = deltat*(r*(x+k1x/2.)-y-k1y/2.-(x+k1x/2.)*(z+k1z/2.))
        k2z = deltat*((x+k1x/2.)*(y+k1y/2.)-b*(z+k1z/2.))
        x += k2x
        y += k2y
        z += k2z
        ax2.scatter3D(x,y,z,marker='.')
        ax2.set_xlabel('Eje x')
        ax2.set_ylabel('Eje y')
        ax2.set_zlabel('Eje z')
        ax2.set_title('Runge-Kutta 2º orden')
        
def sistRK4(deltat,t,x,y,z,sigma,r,b):
    for i in range(500):
        t += deltat
        k1x = deltat*sigma*(y-x)
        k1y = deltat*(r*x-y-x*z)
        k1z = deltat*(x*y-b*z)
        k2x = deltat*sigma*(y+k1y/2.-x-k1x/2.)
        k2y = deltat*(r*(x+k1x/2.)-y-k1y/2.-(x+k1x/2.)*(z+k1z/2.))
        k2z = deltat*((x+k1x/2.)*(y+k1y/2.)-b*(z+k1z/2.))
        k3x = deltat*sigma*(y+k2y/2.-x-k2x/2.)
        k3y = deltat*(r*(x+k2x/2.)-y-k2y/2.-(x+k2x/2.)*(z+k2z/2.))
        k3z = deltat*((x+k2x/2.)*(y+k2y/2.)-b*(z+k2z/2.))
        k4x = deltat*sigma*(y+k3y-x-k3x)
        k4y = deltat*(r*(x+k3x)-y-k3y-(x+k3x)*(z+k3z))
        k4z = deltat*((x+k3x)*(y+k3y)-b*(z+k3z))
        x += k1x/6.+k2x/3.+k3x/3.+k4x/6.
        y += k1y/6.+k2y/3.+k3y/3.+k4y/6.
        z += k1z/6.+k2z/3.+k3z/3.+k4z/6.
        ax1.scatter3D(x,y,z,marker='.')
        ax1.set_xlabel('Eje x')
        ax1.set_ylabel('Eje y')
        ax1.set_zlabel('Eje z')
        ax1.set_title('Runge-Kutta 4º orden')
        
# =========== DATOS ===========
        
sigma = 3
r = 26.5
b = 1
deltat = 0.1
t = 0
x = 0
y = 1
z = 0

# =========== LLAMADA FUNCIONES ===========

fig = plt.figure()
ax1 = plt.axes(projection='3d')
sistRK4(deltat, t, x, y, z, sigma, r, b)

fig2 = plt.figure()
ax2 = plt.axes(projection='3d')
sistRK2(deltat,t,x,y,z,sigma,r,b)

fi3 = plt.figure()
ax3 = plt.axes(projection='3d')
sistEuler(deltat,t,x,y,z,sigma,r,b)
