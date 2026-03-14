# -*- coding: utf-8 -*-
"""
Created on Fri Mar 12 11:25:15 2021

@author: luis.basanta
"""

import numpy as np
import matplotlib.pyplot as plt

# =========== INTERVALO ===========

xmin,xmax = 0.7,1.3 #El intervalo que contiene la raiz es el [0.9,1.1]

# =========== FUNCIÓN ===========

def f(x):
    y = np.log(x)
    return y

# =========== GRAFICA ===========

x = np.linspace(xmin,xmax,1000)
y = f(x)

plt.hlines(0,xmin,xmax,'black')

plt.plot(x,y)
plt.xlabel("X")
plt.ylabel("Y")
plt.title("El intervalo que contiene la raiz es el [0.9,1.1]")

plt.savefig("Grafica.jpg")
