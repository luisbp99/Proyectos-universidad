
import numpy as np
import matplotlib.pyplot as plt

#Funcion

def implicito(T,Tnew,A,alfa,u,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    C = u*deltat/deltax
    
    #Calculo de la matriz A
    for i in range(1,N):
        A[i,i-1] = -C/2.-s
        A[i,i] = 1+2*s
        A[i,i+1] = C/2.-s
        
    #Invertimos la matriz A
    Ainv = np.linalg.inv(A)
    
    for n in range(numint):
        Tnew = np.dot(Ainv,T)
        
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
alfa = 1
u = 4
deltat = 0.001
deltax = 0.1

            
#Condicion inicial
            
T = np.zeros((N+1,1))
T[7:11,0] = 10

#Otros array necesarios

Tnew = np.zeros((N+1,1))
A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

#Representacion de la condicion inicial

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

implicito(T,Tnew,A,alfa,u,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 9')