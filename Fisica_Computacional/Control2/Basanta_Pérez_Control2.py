
import numpy as np
import matplotlib.pyplot as plt

# ============== FUNCIONES ==============

def s(x):
    y = 1+np.exp(-x)*np.sin(4*x)
    return y

def f(x):
    y = 7*x**3-x**2-5*x+3
    return y

def g(x):
    y = 24*x**4-3*x+2
    return y 

def p(x,n):
    y = n*x**2+2*x-(n+1)*np.sqrt(x)
    return y

def r(x):
    y = x**np.sin(x)
    return y

# ============== DERIVADAS ==============
    
def der_del(f,x0,h):
    y = (f(x0+h)-f(x0))/h
    return y

def der_atr(f,x0,h):
    y = (f(x0)-f(x0-h))/h
    return y

def der_cen(f,x0,h):
    y = (f(x0+h)-f(x0-h))/(2*h)
    return y

# ============== EJERCICIO 1 ==============
    
#Datos
    
x0 = 0.5
h = 0.4

#Derivada

for i in range(1,5):
    h = h/2
    x = der_cen(s,x0,h)
    print('La derivada de s(x) para x0=%.1f y h=%.5f es %.5f' %(x0,h,x))
    
#Gráfica

x = np.linspace(0,1,1000)
y = s(x)
    
plt.plot(x,y)
plt.xlabel('x')
plt.ylabel('s(x)')
plt.title('Fig1.Basanta')

# ============== EJERCICIO 2 ==============

print('-'*50)

#Datos

x0 = 0.5
h = 15.0

#Derivada

for i in range(1,5):
    h = h/10
    m = der_atr(g,x0,h)
    n = der_atr(f,x0,h)
    print('La derivada de g(x) para x0=%1f y h=%.5f es %.5f' %(x0,h,m))
    print('La derivada de f(x) para x0=%1f y h=%.5f es %.5f' %(x0,h,n))
    if m > n:
        print('La función g crece más rápido')
    if m < n:
        print('La función f crece más rápido')

    print('-'*50)
    
#Como la función que crece más rapido depende del valor de h no hacemos representación gráfica
    
# ============== EJERCICIO 3 ==============
    
#Datos
    
x0 = 1.25
h = 0.1
n = 2

#Derivada hacia delante ejercicio 3

def der_del3(f,x0,h,n):
    y = (f(x0+h,n)-f(x0,n))/h
    return y

sol =  []
soln = []

for i in range(100):
    x = der_del3(p,x0,h,n)
    if x < 20:
        print('El valor de la derivada para n=%.1f es %.5f' %(n,x))
        sol.append(x)
        soln.append(n)
    n += 1


    