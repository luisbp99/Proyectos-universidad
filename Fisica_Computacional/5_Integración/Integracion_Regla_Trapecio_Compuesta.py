
# =========== DATOS DE ENTRADA ===========

x1, x2 = 0, 1.35
prec = 10**-5

# =========== FUNCIÓN ===========

def f(x):
    y = x**3-3*x**2-x+3
    return y

def integral(f,a,b,n):
    suma = 0
    h = (b-a)/n
    for i in range(n+1):
        suma += f(a+i*h)
    I = h/2*(f(a)+f(b))+h*suma
    return I
    
    
# =========== PROGRAMA ===========

sol = []
i = 1
sol.append(integral(f,x1,x2,2))
sol.append(integral(f,x1,x2,4))

while sol[i-1]-sol[i] > prec:
    sol.append(integral(f,x1,x2,2**(i+2)))
    i += 1
    
print('La integral entre a=%.2f y b=%.2f con una precisón de %f es: %f' %(x1,x2,prec,sol[-1]))
