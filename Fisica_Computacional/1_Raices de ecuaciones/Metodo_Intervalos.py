# -*- coding: utf-8 -*-
"""
Created on Fri Feb 19 13:07:37 2021

@author: Usuario
"""

import numpy as np 

# =========== FUNCIÓN ===========

def f(x):
    y = x**2-3*x+np.exp(x)-2
    return y

# =========== DATOS ===========

xmin,xmax = -2,4
numint = 20

x = np.linspace(xmin,xmax,numint+1)
y = f(x)
n = 0

for i in range(numint):
    if np.sign(y[i]) != np.sign(y[i+1]):
        n += 1
        print('raiz %d: intervalo (%f,%f)' % (n,x[i],x[i+1]))
        
