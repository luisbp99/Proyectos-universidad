
import matplotlib.pyplot as plt
import numpy as np

#Funcion

def FTCS(T,Tnew,u,deltat,deltax):
    
    C = u*deltat/deltax
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = T[i]-0.5*C*(T[i+1]-T[i-1])
            
        #condiciones de frontera
        Tnew[0] = Tnew[1]
        Tnew[N] = Tnew[N-1]
        
        T = np.copy(Tnew)
        
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()

#Datos

N = 20
numint = 100
deltat = 0.001
deltax = 0.1
u = 1

#Condicion inicial

T = np.zeros(N+1)
T[9:11] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representacion condicion inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

FTCS(T,Tnew,u,deltat,deltax)

plt.xlabel('Posicion en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 1')