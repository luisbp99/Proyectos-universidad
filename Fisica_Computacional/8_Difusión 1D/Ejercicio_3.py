#%%Condiciones de frontera de Dirichlet

import numpy as np
import matplotlib.pyplot as plt

#FUNCIÓN

def FTCS(T,Tnew,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    
    for n in range(numint):
        for i in range(2,N-1):
            Tnew[i] = T[i]+s*(-T[i-2]/12+4*T[i-1]/3-2.5*T[i]+4*T[i+1]/3-T[i+2]/12) 
            
        #condiciones de frontera
        Tnew[0] = 5
        Tnew[1] = 5
        Tnew[N] = 3
        Tnew[N-1] = 3
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#DATOS

N = 20
numint = 500
deltat = 0.001
deltax = 0.1
alfa = 1

#CONDICIÓN INICIAL

T = np.zeros(N+1)
T[9:11] = 10

#ARRAY Tnew

Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

#LLAMADA FUNCIÓN

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 3 con condiciones de frontera de Dirichlet')

#%%Condición de frontera de flujo nulo

#FUNCIÓN

def FTCS(T,Tnew,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    
    for n in range(numint):
        for i in range(2,N-1):
            Tnew[i] = T[i]+s*(-T[i-2]/12+4*T[i-1]/3-2.5*T[i]+4*T[i+1]/3-T[i+2]/12) 
            
        #condiciones de frontera
        Tnew[0] = Tnew[2]
        Tnew[1] = Tnew[2]
        Tnew[N] = 3
        Tnew[N-1] = 3
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#DATOS

N = 20
numint = 500
deltat = 0.001
deltax = 0.1
alfa = 1

#CONDICIÓN INICIAL

T = np.zeros(N+1)
T[9:11] = 10

#ARRAY Tnew

Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

#LLAMADA FUNCIÓN

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 3 con condiciones de frontera de flujo nulo')