import tabulate as ta
import numpy as np

# =========== FUNCIÓN ===========

def f(x):
    y = x**3-3*x**2-x+3
    return y

# =========== DATOS ===========

x0 = 1.2

# =========== DEFINICIÓN DERIVADAS ===========

def der10(f):
    y = (f(x0+h)-f(x0-h))/(2*h)
    return y

def der16(f):
    y = (-f(x0+2*h)+8*f(x0+h)-8*f(x0-h)+f(x0-2*h))/(12*h)
    return y

# =========== CÁLCULO DERIVADAS ===========

x = []
y = []
g = []

for i in range(11):
    h = 10**-i
    g.append(h)
    x.append(der10(f))
    y.append(der16(f))
    
# =========== TABLA ===========
    
headers = ['h','Ecuación (10)','Ecuación (16)']
table = zip(g,x,y)
print(ta.tabulate(table,headers = headers,floatfmt = '.10f',numalign='center'))