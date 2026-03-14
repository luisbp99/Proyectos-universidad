# -*- coding: utf-8 -*-
"""
Created on Fri Mar 12 11:55:00 2021

@author: luis.basanta
"""

import numpy as np

# =========== DATOS DE ENTRADA ===========
#matriz de coeficientes
a = np.array([[2,-1],[1,1]],float)
#vector columna de los términos independientes
b = np.array([[4],[5]],float)

# =========== PROGRAMA ===========
print('\neliminación de Gauss sin piveteo')
#creamos la matriz ampliada
ab = np.concatenate((a,b),axis=1)
print('\nmatriz ampliada inicial')
print(ab)

#determinar el número de filas y de columnas
F,C = np.shape(ab)

#obtener matriz triangular superior
for i in range(F-1):
    for j in range(i+1,F):
        factor = ab[j,i]/ab[i,i]
        ab[j] -= ab[i]*factor
        print('\ndesarrolla el elemento (%d,%d)' %(i+1,i+1))
        print(ab)
        
# sustitución regresiva
x = np.zeros((F,1))

print("\nSolución del sistema")

for i in range(F-1,-1,-1):
    suma = np.dot(ab[i,0:F],x)
    x[i,0] = (ab[i,-1]-suma)/ab[i][i]
    
for i in range(len(x)):
    print("x%d = %.3f" %(i+1,x[i]))