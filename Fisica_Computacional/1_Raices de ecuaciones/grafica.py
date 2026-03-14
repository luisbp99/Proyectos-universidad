# -*- coding: utf-8 -*-
"""
Created on Wed Mar 10 17:51:41 2021

@author: Usuario
"""

import numpy as np
import matplotlib.pyplot as plt

# =========== DATOS DE ENTRADA ===========

xmin, xmax = -300,10

# =========== FUNCIÓN ===========

def f(x):
    y = x**2-3*x+np.exp(x)-2
    return y

# =========== PROGRAMA ===========

x = np.linspace(xmin,xmax,1000)
y = f(x)

plt.plot(x,y)

plt.xlabel('X')
plt.ylabel('Y')
plt.title('$x^2-3x+e^x-2$')
plt.hlines(0,xmin,xmax,'black')

plt.savefig("grafica.jpg")