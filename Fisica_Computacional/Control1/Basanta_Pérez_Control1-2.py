# -*- coding: utf-8 -*-
"""
Created on Fri Mar 12 11:40:08 2021

@author: luis.basanta
"""

import numpy as np

# =========== FUNCIÓN ===========

def f(x):
    y = (x**3+3*x-5)/(x+2)**2
    return y

# =========== DATOS ===========
    
xmin,xmax = 0,3
numint = 50

x = np.linspace(xmin,xmax,numint+1)
y = f(x)
n = 0

for i in range(numint):
    if np.sign(y[i]) != np.sign(y[i+1]):
        n += 1
        print('raiz %d: intervalo (%.2f,%.2f)' % (n,x[i],x[i+1]))
        

        