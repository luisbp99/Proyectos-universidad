
import numpy as np
import matplotlib.pyplot as plt

#Funcion

def DufortFrankel(T,Tnew,Told,u,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    C = u*deltat/deltax
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = 2*s*(T[i-1]+T[i+1])/(1+2*s)-C/(1+2*s)*(T[i+1]-T[i-1])+(1-2*s)/(1+2*s)*Told[i]
            Tnew[i] = 0.5*(Tnew[i]+T[i])
    
        #Condiciones de frontera
        Tnew[0] = 0
        Tnew[N] = 0
    
        Told = np.copy(T)
        T = np.copy(Tnew)
    
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
        
#Datos

N = 20
numint = 1000
deltat = 0.001
deltax = 0.1
u = 4
alfa = 0.5

#Condicion inicial

T = np.zeros(N+1)
T[7:11] = 10

#Otros array necesarios

Told = np.copy(T)
Tnew = np.zeros(N+1)

#Representación condición inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

DufortFrankel(T,Tnew,Told,u,alfa,deltat,deltax)

plt.xlabel('Posicion en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 8')