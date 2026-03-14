
# =========== DATOS DE ENTRADA ===========

x1, x2 = 0, 1.35
prec = 10**-5

# =========== FUNCIÓN ===========

def f(x):
    y = x**3-3*x**2-x+3
    return y

def integral(f,a,b,n):
    suma1 = 0
    suma2 = 0
    h = (b-a)/(3*n)
    for i in range(n):
        suma1 += f(a+3*i*h)
    for i in range(n+1):
        suma2 += f(a+(3*i-2)*h)+f(a+(3*i-1)*h)
    I = 3*h/8*(f(a)+f(b))+6*h*suma1/8+9*h*suma2/8
    return I
    
# =========== PROGRAMA ===========

sol = []
i = 1
sol.append(integral(f,x1,x2,2))
sol.append(integral(f,x1,x2,4))

while sol[i-1]-sol[i] > prec:
    sol.append(integral(f,x1,x2,2**(i+2)))
    i += 1
    
print('La integral entre a=%.2f y b=%.2f con una precisión de %f es: %f' %(x1,x2,prec,sol[-1]))