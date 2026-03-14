
import random as rdm
import tabulate as ta
import time

# =========== FUNCIÓN ===========

def f(x,y,r):
    if x**2+y**2 > r**2:
        z = 0
    else:
        z = 1
    return z

# =========== DATOS ENTRADA ===========

r = 1.5
a, b = -r,r
V = 4*r**2

# =========== CÁLCULO ===========

sol = []
num = []
error = []

t1=time.time()

for i in range(2,9):
    suma = 0
    suma_error = 0
    N = 10**i
    num.append(N)
    for i in range(N+1):
        x = rdm.uniform(a,b)
        y = rdm.uniform(a,b)
        suma += f(x,y,r)
        suma_error += f(x,y,r)**2
    I = V*(suma/N)
    E = V*(((suma_error/N)-(suma/N)**2)/N)**0.5
    sol.append(I)
    error.append(E)

t2=time.time()
print('Tiempo que tarda en ejecutarse el programa %f' %(t2-t1))
print('-'*50)

# =========== TABLA ===========

headers = ['N','Área','Error']
table = zip(num,sol,error)
print(ta.tabulate(table,headers = headers,floatfmt = '.10f',numalign='center'))