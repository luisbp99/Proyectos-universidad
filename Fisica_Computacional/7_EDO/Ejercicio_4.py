
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# =========== FUNCIONES ===========

def sistEuler(deltat,t,x,y,z,sigma,r,b):
    for i in range(1000):
        t += deltat
        x += deltat*sigma*(y-x)
        y += deltat*(r*x-y-x*z)
        z += deltat*(x*y-b*z)
        plt.plot(x,y,'*b')
        
def sistRK2(deltat,t,x,y,z,sigma,r,b):
    for i in range(1000):
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
        plt.plot(x,y,'*k')
        
def sistRK4(deltat,t,x,y,z,sigma,r,b):
    for i in range(1000):
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
        plt.plot(x,y,'*r')
        plt.xlabel('x')
        plt.ylabel('y')
        plt.title('Ejercicio 4')

# =========== DATOS ===========

sigma = 3
r = 26.5
b = 1
deltat = 0.01
t = 0
x = 0
y = 1
z = 0

# =========== LLAMADA FUNCIONES ===========

sistEuler(deltat,t,x,y,z,sigma,r,b)
sistRK2(deltat,t,x,y,z,sigma,r,b)
sistRK4(deltat,t,x,y,z,sigma,r,b)

# =========== LEYENDA ===========

red_patch = mpatches.Patch(color='red', label='Método Runge-Kutta 4º orden')
blue_patch = mpatches.Patch(color='blue', label='Método de Euler')
black_patch = mpatches.Patch(color='black', label='Método Runge-Kutta 2º orden')
plt.legend(handles=[blue_patch,black_patch,red_patch])