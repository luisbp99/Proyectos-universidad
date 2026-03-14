#Ejercicio 5 Luis Basanta Pérez

import numpy as np
import matplotlib.pyplot as plt

#Funcion

def esquema(T,Tnew,u,deltat,deltax,q):
    
    C = u*deltat/deltax
    
    for n in range(numint):
        for i in range(1,N):
            Tnew[i] = -C*(T[i+1]-T[i-1])/2.-C*q*(T[i-2]-3*T[i-1]+3*T[i]-T[i+1])/3.+T[i]
        
        #Condiciones de frontera
        Tnew[0] = Tnew[1]
        Tnew[N] = Tnew[N-1]
        
        T = np.copy(Tnew)
        
        if n%10==0:
            plt.figure(2)
            plt.plot(T)
    
#Datos
    
u = 1
numint = 100
N = 20
deltat = 0.0001 
deltax = 0.1 
q = 0.5

#Condicion inicial

T = np.zeros(N+1)
T[7:12] = 10

#Array Tnew

Tnew = np.zeros(N+1)

#Representacion condicion inicial

plt.figure(2)
plt.plot(T)


esquema(T,Tnew,u,deltat,deltax,q)

plt.xlabel('Posición en la barra')
plt.ylabel('Temperatura')
plt.title('Control 3')
plt.show()

#El valor de q que escogemos es 0.5 para así eliminar uno de los términos en la expresión del error de truncamiento.
#Los valores de deltat y deltax los escogemos de esa manera para que C sea menor que 0.01 y deltat tan pequeño para que minimice el error de truncamiento
