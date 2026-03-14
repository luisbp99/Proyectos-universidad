
# =========== FUNCION ===========

def f(x):
    y = x**3-3*x**2-x+3
    return y

# =========== DATOS ===========

x0 = 1.2
h = 0.1

# =========== PROGRAMA ===========

def der(f):
    y = (f(x0+h)-f(x0))/h
    return y

print('El valor de la derivada en x0=%f con un h=%f es %f' %(x0,h,der(f)))