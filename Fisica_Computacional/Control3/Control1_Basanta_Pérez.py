#Luis Basanta Pérez Ejercicio 5

import matplotlib.pyplot as plt
import numpy as np 

#DATOS

mu = 1.3
deltat = 0.1
r = 0.1
theta = 0.3
t = 0

#FUNCIÓN

def sistRK4(t,r,theta,deltat,mu):
    for i in range(100):
        t +=deltat
        
        k1r = deltat*r*(1-r**2)
        k1theta = deltat*(mu-np.sin(theta))
        k2r = deltat*(r+k1r/2.)*(1-(r+k1r/2.)**2)
        k2theta = deltat*(mu-np.sin(theta+k1theta/2.))
        k3r = deltat*(r+k2r/2.)*(1-(r+k2r/2.)**2)
        k3theta = deltat*(mu-np.sin(theta+k2theta/2.))
        k4r = deltat*(r+k3r)*(1-(r+k3r)**2)
        k4theta = deltat*(mu-np.sin(theta+k3theta))
        
        r += k1r/6.+k2r/3.+k3r/3.+k4r/6.
        theta += k1theta/6.+k2theta/3.+k3theta/3.+k4theta/6.
        
        x = r*np.cos(theta)
        y = r*np.sin(theta)
        
        plt.plot(x,y,'*b')
        plt.xlabel('x')
        plt.ylabel('y')
        
        
sistRK4(t,r,theta,deltat,mu)
plt.show()
