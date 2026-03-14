#%%Condición de frontera de Dirichlet

import numpy as np
import matplotlib.pyplot as plt

#FUNCIÓN

def FTCS(T,Tnew,Told,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = s*(T[i+1]-2*T[i]+T[i-1])/1.5-Told[i]/3+4*T[i]/3
       
        #condiciones de frontera
        Tnew[0] = 5
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        Told = np.copy(T)
        
        if n%10 == 0:
            plt.figure(1)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#DATOS

N = 20
numint = 1000
deltat = 0.001
deltax = 0.1
alfa = 1

#CONDICIÓN INICIAL

T = np.zeros(N+1)
T[9:11] = 10
Told = np.copy(T)

#ARRAY Tnew

Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(1)
plt.plot(T,'-r')
plt.pause(0.1)

#LLAMADA FUNCIÓN

FTCS(T,Tnew,Told,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 2 con condiciones de forntera de Dirichlet')

#%%Condición de frontera de flujo nulo

#FUNCIÓN

def FTCS(T,Tnew,Told,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = s*(T[i+1]-2*T[i]+T[i-1])/1.5-Told[i]/3+4*T[i]/3
       
        #condiciones de frontera
        Tnew[0] = Tnew[1]
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        Told = np.copy(T)
        
        if n%10 == 0:
            plt.figure(1)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#DATOS

N = 20
numint = 1000
deltat = 0.001
deltax = 0.1
alfa = 1

#CONDICIÓN INICIAL

T = np.zeros(N+1)
T[9:11] = 10
Told = np.copy(T)

#ARRAY Tnew

Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(1)
plt.plot(T,'-r')
plt.pause(0.1)

#LLAMADA FUNCIÓN

FTCS(T,Tnew,Told,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 2 con condiciones de frontera de flujo nulo')