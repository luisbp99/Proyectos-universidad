
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# =========== FUNCIONES ===========

def sistEuler(deltat,t,x,y,omega,b,F):
    for i in range(200):
        t += deltat
        x += deltat*y
        y += deltat*(-omega**2*x-b*y+F*np.cos(omega*t))
        plt.plot(t,x,'b*')
        
def sistRK2(deltat,t,x,y,omega,b,F):
    for i in range(200):
        t += deltat
        k1x = deltat*y
        k1y = deltat*(-omega**2*x-b*y+F*np.cos(omega*t))
        k2x = deltat*(y+k1y/2.)
        k2y = deltat*(-omega**2*(x+k1x/2.)-b*(y+k1y/2.)+F*np.cos(omega*(t+deltat/2.)))
        x += k2x
        y += k2y
        plt.plot(t,x,'*k')
        
def sistRK4(deltat,t,x,y,omega,b,F):
    for i in range(200):
        t += deltat
        k1x = deltat*y
        k1y = deltat*(-omega**2*x-b*y+F*np.cos(omega*t))
        k2x = deltat*(y+k1y/2.)
        k2y = deltat*(-omega**2*(x+k1x/2.)-b*(y+k1y/2.)+F*np.cos(omega*(t+deltat/2.)))
        k3x = deltat*(y+k2y/2.)
        k3y = deltat*(-omega**2*(x+k2x/2.)-b*(y+k2y/2.)+F*np.cos(omega*(t+deltat/2.)))
        k4x = deltat*(y+k3y)
        k4y = deltat*(-omega**2*(x+k3x)-b*(y+k3y)+F*np.cos(omega*(t+deltat)))
        x += k1x/6.+k2x/3.+k3x/3.+k4x/6.
        y += k1y/6.+k2y/3.+k3y/3.+k4y/6.
        plt.plot(t,x,'*r')
        plt.xlabel('Tiempo')
        plt.ylabel('X')
        plt.title('Ejercicio 3')
        
# =========== DATOS ===========

deltat = 0.001
t = 0
x = 1
y = 1
omega = 50
b = 10
F = 10

# =========== LLAMADA DE FUNCIONES ===========

sistEuler(deltat, t, x, y, omega, b, F)
sistRK2(deltat, t, x, y, omega, b, F)
sistRK4(deltat, t, x, y, omega, b, F)

# =========== LEYENDA ===========

red_patch = mpatches.Patch(color='red', label='Método Runge-Kutta 4º orden')
blue_patch = mpatches.Patch(color='blue', label='Método de Euler')
black_patch = mpatches.Patch(color='black', label='Método Runge-Kutta 2º orden')
plt.legend(handles=[blue_patch,black_patch,red_patch])