#%%Condiciones de frontera de Dirichlet

import numpy as np
import matplotlib.pyplot as plt

#DATOS

N = 20
numint = 1000
deltat = 0.1
deltax = 0.5 
alfa = 1

#FUNCIÓN

def DufortFrankel(T,Told,Tnew,alfa,deltat,deltax):
    s = alfa*deltat/deltax/deltax
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = 2*s/(1+2*s)*(T[i-1]+T[i+1])+(1-2*s)/(1+2*s)*Told[i]
            Tnew[i] = 0.5*(Tnew[i]+T[i])
        
        #condiciones de frontera
        Tnew[0] = 5
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        Told = np.copy(T)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
            
#CONDICIÓN INICIAL
            
T = np.zeros(N+1)
T[9:11] = 10

Told = np.copy(T)
Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

DufortFrankel(T,Told,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 4 con condiciones de frontera de Dirichlet')

#%%Condiciones de frontera de flujo nulo

#DATOS

N = 20
numint = 1000
deltat = 0.1
deltax = 0.5 
alfa = 1

#FUNCIÓN

def DufortFrankel(T,Told,Tnew,alfa,deltat,deltax):
    s = alfa*deltat/deltax/deltax
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = 2*s/(1+2*s)*(T[i-1]+T[i+1])+(1-2*s)/(1+2*s)*Told[i]
            Tnew[i] = 0.5*(Tnew[i]+T[i])
        
        #condiciones de frontera
        Tnew[0] = Tnew[1]
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        Told = np.copy(T)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
            
#CONDICIÓN INICIAL
            
T = np.zeros(N+1)
T[9:11] = 10

Told = np.copy(T)
Tnew = np.zeros(N+1)

#REPRESENTACIÓN CONDICIÓN INICIAL

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

DufortFrankel(T,Told,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 4 con condiciones de frontera de flujo nulo')