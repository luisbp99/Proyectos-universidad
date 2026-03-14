#%%Condiciones de frontera de Dirichlet

import numpy as np
import matplotlib.pyplot as plt

#Datos

N = 20
numint = 1000
deltat = 0.1
deltax = 0.5 
alfa = 1

#FUNCIÓN

def implicito(T,Tnew,A,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax/deltax
    
    #Calculo de la matriz A
    for i in range(1,N):
        A[i,i-1] = -s
        A[i,i] = 1+2*s
        A[i,i+1] = -s
    
    #Calculo de la matriz inversa de A
    Ainv = np.linalg.inv(A)
    
    for n in range(numint):
          Tnew = np.dot(Ainv,T)  
          
          #Condiciones de frontera
          Tnew[0] = 5
          Tnew[N] = 3
          
          T = np.copy(Tnew)
          
          if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
        

#CONDICIÓN INICIAL

T = np.zeros((N+1,1))
T[7:11,0] = 20

#Otros array necesaros

Tnew = np.copy(T)
A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

#REPRESENTACIÓN CONDICIÓN INICIAL3

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

implicito(T, Tnew,A, alfa, deltat, deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 5 con condiciones de frontera de Dirichlet')

#%%Condiciones de frontera de flujo nulo

#Datos

N = 20
numint = 1000
deltat = 0.1
deltax = 0.5 
alfa = 1

#FUNCIÓN

def implicito(T,Tnew,A,alfa,deltat,deltax):
    
    s = alfa*deltat/deltax/deltax
    
    #Calculo de la matriz A
    for i in range(1,N):
        A[i,i-1] = -s
        A[i,i] = 1+2*s
        A[i,i+1] = -s
    
    #Calculo de la matriz inversa de A
    Ainv = np.linalg.inv(A)
    
    for n in range(numint):
          Tnew = np.dot(Ainv,T)  
          
          #Condiciones de frontera
          Tnew[0] = Tnew[1]
          Tnew[N] = 3
          
          T = np.copy(Tnew)
          
          if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
        

#CONDICIÓN INICIAL

T = np.zeros((N+1,1))
T[7:11,0] = 20

#Otros array necesaros

Tnew = np.copy(T)
A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

#REPRESENTACIÓN CONDICIÓN INICIAL3

plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

implicito(T, Tnew,A, alfa, deltat, deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 5 con condiciones de frontera de flujo nulo')