
import numpy as np
import matplotlib.pyplot as plt

#Funcion

def upwind(T,Tnew,alfa,u,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    C = u*deltat/deltax
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = s*(T[i+1]-2*T[i]+T[i-1])-C*(T[i]-T[i-1])+T[i]
        
        #Condiciones de frontera
        Tnew[0] = 0
        Tnew[N] = 0
        
        T = np.copy(Tnew)
        
        if n%10==0:
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
alfa = 1

#Condicion inicial

T = np.zeros(N+1)
T[7:11] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representación condición inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

upwind(T, Tnew, alfa, u, deltat, deltax)

plt.xlabel('Posicion en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 7')