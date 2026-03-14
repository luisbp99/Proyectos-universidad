
import numpy as np
import matplotlib.pyplot as plt

#Datos

N = 20
numint = 1000
deltat = 0.001
deltax = 0.1
alfa = 1
u = 4

#Funcion

def CrankNicolson(T,Tnew,A,B,alfa,u,deltat,deltax):
    
    s = alfa*deltat/deltax**2
    C = u*deltat/deltax
    
    #Calculo de la matriz A
    for i in range(1,N):
        A[i,i+1] = C/4.-s/2.
        A[i,i] = 1+s
        A[i,i-1] = -C/4.-s/2.
        
    #Invertimos la matriz A
    Ainv = np.linalg.inv(A)
    
    #Calculo de la matriz B
    for i in range(1,N):
        B[i,i+1] = s/2.-C/4.
        B[i,i] = 1-s
        B[i,i-1] = s/2.+C/4.
        
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
T[7:11,0] = 10

#Otros array necesaros
Tnew = np.copy(T)

A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

B = np.copy(A)

#Representacion de la condicion inicial
plt.close('all')
plt.figure(2)
plt.plot(T,'-r')
plt.pause(0.1)

CrankNicolson(T,Tnew,A,B,alfa,u,deltat,deltax)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Ejercicio 10')