# -*- coding: utf-8 -*-
"""
Created on Fri Mar  5 11:20:46 2021

@author: luis.basanta
"""

import pandas as pd
import matplotlib.pyplot as plt

datos = pd.pandas.read_csv('C:\\Users\\Usuario\\Documents\\universidad\\3º\\Física Computacional\\3_Tratamiento de datos\casos_tecnica_ccaa.csv')

datos["fecha"] = pd.to_datetime(datos["fecha"])

g = datos["ccaa_iso"] == "GA"
c = datos["ccaa_iso"] == "CT"
m = datos["ccaa_iso"] == "MD"
a = datos["ccaa_iso"] == "AN"

galicia = datos[g] 
cataluña = datos[c]
madrid = datos[m]
andalucia = datos[a]

fig = plt.figure()

ax = fig.add_subplot(2,2,2)
ax.plot(madrid["fecha"],madrid["num_casos"])
plt.title('Madrid')


ax2 = fig.add_subplot(2,2,1)
ax2.plot(galicia["fecha"],galicia["num_casos"])
plt.title('Galicia')

ax3 = fig.add_subplot(2,2,3)
ax3.plot(cataluña["fecha"],cataluña["num_casos"])
plt.title('Cataluña')

ax = fig.add_subplot(2,2,4)
ax.plot(andalucia["fecha"],andalucia["num_casos"])
plt.title('Andalucía')