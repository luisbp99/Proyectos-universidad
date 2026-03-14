
# =========== DATOS DE ENTRADA ===========

x1, x2 = 0, 1.35

# =========== FUNCIONES ===========

def f(x):
    y = x**3-3*x**2-x+3
    return y

def integral(f,a,b):
    y = (b-a)*(f(b)+f(a))/2
    return y

# =========== MOSTRAR RESULTADO ===========

print('El valor de la integral entre a=%.2f y b=%.2f es %.5f' %(x1,x2,integral(f,x1,x2)))