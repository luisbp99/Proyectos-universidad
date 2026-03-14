
import random as rdm
import tabulate as ta
import numpy as np
import time 

# =========== FUNCIÓN ===========

def f(x):
    y = 1/x**2*np.exp(1-1/x)
    return y

# =========== DATOS ENTRADA ===========

a, b = 0, 1
V = b-a
    
# =========== CÁLCULO ===========

sol = []
num = []
error = []

t1=time.time()

for i in range(2,8):
    suma = 0
    suma_error = 0
    N = 10**i
    num.append(N)
    for i in range(N+1):
        x = rdm.uniform(a,b)
        suma += f(x)
        suma_error += f(x)**2
    I = V*(suma/N)
    E = V*(((suma_error/N)-(suma/N)**2)/N)**0.5
    sol.append(I)
    error.append(E)

t2=time.time()
print('Tiempo que tarda en ejecutarse el programa %f' %(t2-t1))
print('-'*50)

# =========== TABLA ===========

headers = ['N','I','Error']
table = zip(num,sol,error)
print(ta.tabulate(table,headers = headers,floatfmt = '.10f',numalign='center'))