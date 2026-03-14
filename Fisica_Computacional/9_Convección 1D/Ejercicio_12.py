
import numpy as np
import matplotlib.pyplot as plt

#Funcion

def FTCS(T,Tnew,alfax,alfay,deltat,deltax):
    
    sx = alfax*deltat/deltax**2
    sy = alfay*deltat/deltax**2
    
    for n in range(numint):
        for i in range(1,N):
            for j in range(1,N):
                Tnew[i,j] = T[i,j]+sx*(T[i-1,j]-2*T[i,j]+T[i+1,j])+sy*(T[i,j-1]-2*T[i,j]+T[i,j+1])
                
        #Condiciones de frontera
        Tnew[0,:] = 5
        Tnew[20,:] = 5
        Tnew[:,0] = 5
        Tnew[:,20] = 5
        
        T = np.copy(Tnew)
        
        if n%10==0:
            plt.figure(2)
            plt.pcolor(T)
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
T[7:11,7:11] = 10

#Array Tnew

Tnew = np.zeros((N+1,N+1))

#Representación condicion inicial

plt.close('all')
plt.figure(2)
plt.pcolor(T)
plt.pause(0.1)

plt.xlabel('Posición en la barra eje X')
plt.ylabel('Posición en la barra eje Y')
plt.title('Ejercicio 12')
plt.colorbar()

FTCS(T,Tnew,alfax,alfay,deltat,deltax)