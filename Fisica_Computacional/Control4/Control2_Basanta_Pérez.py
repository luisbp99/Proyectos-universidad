
#Luis Basanta Pérez Ejercicio 5

import numpy as np
import matplotlib.pyplot as plt

#Datos

alfa = 1
deltat = 10**-4
deltax = 0.1
numint = 1000
N = 20

#Función

def ecuacion(deltat,deltax,alfa,T,Tnew):
    
    s = alfa*deltat/deltax**2
    
    for n in range(numint):
        for i in range(2,N-1):
            Tnew[i] = s*(-T[i-2]+16*T[i-1]-30*T[i]+16*T[i+1]-T[i+2])+T[i]
            
        #Condiciones de frontera
        Tnew[0] = 0
        Tnew[1] = 0
        Tnew[N-1] = 5*np.sin(n*deltat) #Para que uno de los extremos oscile entre 5 y -5 usamos el seno, pero como deltat es tan pequeño no le da tiempo a hacer la oscilacion completa
        Tnew[N] = 5*np.sin(n*deltat)
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(1)
            plt.plot(T)
            
#Condición inicial
            
T = np.zeros(N+1)
T[7:11] = 10

Tnew = np.zeros(N+1)

ecuacion(deltat,deltax,alfa,T,Tnew)

plt.xlabel('Posicion en la barra')
plt.ylabel('Temperatura')
plt.show()
