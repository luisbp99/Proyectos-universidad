# -*- coding: utf-8 -*-
"""
Created on Mon Feb 22 14:04:17 2021

@author: Usuario
"""

import numpy as np 
import matplotlib.pylab as plt

# =========== DATOS ===========
    
xmin,xmax = -2,4
numint = 20

prec = 1e-11   #precision de la solucion

# =========== FUNCIONES ===========

def f(x):
    y = x**2-3*x+np.exp(x)-2
    return y

def biseccion(f,a,b,p):
    c = (a+b)/2
    while abs(f(c))>p:
        c=(a+b)/2
        if np.sign(f(a)) != np.sign(f(c)):
            b = c
        else:
            a = c
    return (c,f(c))

# =========== PROGRAMA ===========
            
x = np.linspace(xmin,xmax,numint+1)
y = f(x)
n = 0

#variables para almacenar raíces
xs = []
ys = []

print('='*10)
print('Método de la bisección')

for i in range(numint):
    if np.sign(y[i]) != np.sign(y[i+1]):
        n += 1
        print('raiz %d: intervalo (%f,%f)' % (n,x[i],x[i+1]))
        sol = biseccion(f,x[i],x[i+1],prec)
        xs.append(sol[0])
        ys.append(sol[1])
        print('x%d=%.10f   f(x%d)=%.13f' % (n,xs[n-1],n,ys[n-1]))
        
        
# =========== GRÁFICA ===========

plt.plot(x,y,'b-')

plt.hlines(0,xmin,xmax,'black')

plt.xlabel('x')
plt.ylabel('y')
plt.title('$y=x^2-3x+e^x-2$')

plt.show()