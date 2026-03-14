
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# =========== FUNCIONES ===========

def fun(P):
    return r*P*(1-P/k)

def ecEuler(f,deltat,t,x,r,k):
    for i in range(100):
        t += deltat
        x += deltat*f(x)
        plt.plot(t,x,'*b')
        
def ecRK2(f,deltat,t,x,r,k):
    for i in range(100):
        t += deltat
        k1 = deltat*f(x)
        k2 = deltat*f(x+k1/2.)
        x += k2
        plt.plot(t,x,'^k')
        
def ecRK4(f,deltat,t,x,r,k):
    for i in range(100):
        t += deltat
        k1 = deltat*f(x)
        k2 = deltat*f(x+k1/2.)
        k3 = deltat*f(x+k2/2.)
        k4 = deltat*f(x+k3)
        x += k1/6.+k2/3.+k3/3.+k4/6.
        plt.plot(t,x,'*r')
        plt.xlabel('Tiempo')
        plt.ylabel('X')
        plt.title('Ejercicio 1')
        
# =========== DATOS ===========
    
deltat = 0.01
t = 0
x = 10
r = 1
k = 1

# =========== LLAMADA FUNCIONES ===========

ecEuler(fun,deltat,t,x,r,k)
ecRK2(fun,deltat,t,x,r,k)
ecRK4(fun,deltat,t,x,r,k) 

# =========== LEYENDA ===========

red_patch = mpatches.Patch(color='red', label='Método Runge-Kutta 4º orden')
blue_patch = mpatches.Patch(color='blue', label='Método de Euler')
black_patch = mpatches.Patch(color='black', label='Método Runge-Kutta 2º orden')
plt.legend(handles=[blue_patch,black_patch,red_patch]) 