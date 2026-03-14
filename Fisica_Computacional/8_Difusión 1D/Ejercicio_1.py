#%%APARTADO A

import numpy as np
import matplotlib.pyplot as plt

#Funcion

def FTCS(T,Tnew,alfa,deltat,deltax):
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = T[i]+alfa*deltat/deltax/deltax*(T[i+1]-2.*T[i]+T[i-1])
            
        #condiciones de frontera
        Tnew[0] = 5
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#Datos

N = 20
numint = 1000
deltat = 0.1
deltax = 0.5 
alfa = 1

#Condicion inicial

T = np.zeros(N+1)
T[9:11] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representación condicion inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

#Llamada funcion

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 1a')

#%% APARTADO B

#Condicion inicial

T = np.zeros(N+1)
T[7:12] = 20

#Representacion condicion inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 1b')

#%% APARTADO C

#Funcion 

def FTCS(T,Tnew,alfa,deltat,deltax):
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = T[i]+alfa*deltat/deltax/deltax*(T[i+1]-2.*T[i]+T[i-1])
            
        #condiciones de frontera
        Tnew[0] = 5
        Tnew[N] = np.sin(0.5*n*deltat)
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(1)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#Condicion inicial

T = np.zeros(N+1)
T[9:11] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representacion condicion inicial

plt.close('all')
plt.figure(1)
plt.plot(T,'-r')
plt.pause(0.1)

#Llamada funcion

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 1c')

#%% APARTADO D

#Funcion

def FTCS(T,Tnew,alfa,deltat,deltax):
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = T[i]+alfa*deltat/deltax/deltax*(T[i-1]-2.*T[i]+T[i+1])
            
        #condiciones de frontera
        Tnew[0] = T[1]
        Tnew[N] = 3
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(1)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
            
#Condicion inicial

T = np.zeros(N+1)
T[9:11] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representacion condicion inicial

plt.close('all')
plt.figure(1)
plt.plot(T,'-r')
plt.pause(0.1)

#Llamada funcion

FTCS(T,Tnew,alfa,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 1d')
