
import numpy as np
import matplotlib.pyplot as plt

#Funcion

def ADI(T,Tnew,Tas,A,B,E,F,alfax,alfay,deltat,deltax):
    
    sx = alfax*deltat/deltax**2
    sy = alfay*deltat/deltax**2
    
    #Matriz A
    for i in range(1,N):
        A[i,i+1] = -sx/2.
        A[i,i] = 1+sx
        A[i,i-1] = -sx/2.
        
    #Invertimos la matriz A
    Ainv = np.linalg.inv(A)
    
    #Matriz B
    for i in range(1,N):
        B[i,i+1] = sy/2.
        B[i,i] = 1-sy
        B[i,i-1] = sy/2.
        
    #Matriz D producto de las matrices Ainv y B
    D = np.dot(Ainv,B)
        
    #Matriz E
    for i in range(1,N):
        E[i,i+1] = -sy/2.
        E[i,i] = 1+sy
        E[i,i-1] = -sy/2.
    
    #Invertimos la matriz E
    Einv = np.linalg.inv(E)
    
    #Matriz F
    for i in range(1,N):
        F[i,i+1] = sx/2.
        F[i,i] = 1-sx
        F[i,i-1] = sx/2.
    
    #Matriz G producto de las matrices Einv y F
    G = np.dot(Einv,F)
    
    for n in range(numint):
        Tas = np.dot(D,T)
        Tnew = np.dot(G,Tas)
        
        #Condiciones de frontera
        Tnew[0,:] = 5
        Tnew[20,:] = 5
        Tnew[:,0] = 5
        Tnew[:,20] = 5
        
        T = np.copy(Tas)
        Tas = np.copy(Tnew)
        
        if n%10==0:
            plt.figure(2)
            plt.pcolor(Tas)
            plt.clim(0,10)
            plt.pause(0.5)
            plt.show()

#Datos

N = 20
numint = 100
deltat = 0.001
deltax = 0.1
alfax = 1
alfay = 1

#Condicion inicial

T = np.zeros((N+1,N+1))
T[7:14,7:14] = 10

#Otros array necesarios

Tnew = np.zeros((N+1,N+1))

Tas = np.zeros((N+1,N+1))

A = np.zeros((N+1,N+1))
A[0,0] = 1
A[20,20] = 1

B = np.copy(A)
E = np.copy(A)
F = np.copy(A)

#Representación condicion inicial

plt.close('all')
plt.figure(2)
plt.pcolor(T)
plt.pause(0.1)

plt.xlabel('Posición en la barra eje X')
plt.ylabel('Posición en la barra eje Y')
plt.title('Ejercicio 12')
plt.colorbar()

ADI(T,Tnew,Tas,A,B,E,F,alfax,alfay,deltat,deltax)