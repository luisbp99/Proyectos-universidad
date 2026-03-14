
import numpy as np
import matplotlib.pyplot as plt

#Datos

N = 20
numint = 100
deltat = 0.0001
deltax = 0.1
u = 4

#Funcion

def CrankNicolson(T,Tnew,A,B,u,deltat,deltax): 
    
    C = u*deltat/deltax
    
    #Calculo de la matriz A
    for i in range(1,N):
        A[i,i-1] = -C/4.
        A[i,i] = 1
        A[i,i+1] = C/4.
        
    #Invertimos la matriz A
    Ainv = np.linalg.inv(A)
        
    #Calculo de la matriz B
    for i in range(1,N):
        B[i,i-1] = C/4.
        B[i,i] = 1
        B[i,i+1] = -C/4.
    
    #Matriz D producto de las matrices Ainv y B
    D = np.dot(Ainv,B)
    
    for n in range(numint):
        Tnew = np.dot(D,T)
        
        #Condiciones de frontera
        Tnew[0] = 0
        Tnew[N] = 0
        
        T = np.copy(Tnew)
          
        if n%10 == 0:
            plt.figure(2)
            plt.plot(T)
            plt.pause(0.01)
            plt.show()
            
#Condicion inicial
T = np.zeros((N+1,1))
T[7:11,0] = 20

#Otros array necesaros
Tnew = np.zeros((N+1,1))

A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

B = np.copy(A)

#Representacion de la condicion inicial
plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

CrankNicolson(T,Tnew,A,B,u,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 5')