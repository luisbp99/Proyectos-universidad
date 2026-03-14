
import matplotlib.pyplot as plt

# =========== DATOS ===========

r = 1
k = 1
p = 10
t = 0
delmax = 0.1
numint = 100
dif = 0.1

# =========== FUNCIONES ===========

def fun(P):
    return r*P*(1-P/k)

def Euler(f,t,x,delmax,dif,numint):
    
    delmin = delmax/100.
    deltat = delmax/10.
    difmax = dif*1.1
    difmin = dif*0.9
    
    for i in range(numint):
        
        var = 0
        while var == 0:
            
            if deltat < delmin:
                deltat = delmin
                break 
            
            elif deltat > delmax:
                deltat = delmax
                break
                
            elif abs(deltat*f(x)) < difmin:
                deltat *= 1.5
                
            elif abs(deltat*f(x)) > difmax:
                deltat /= 1.3
                
            else:
                var = 1
        
        t += deltat
        x += deltat*f(x)
        
        plt.plot(t,x,'*b')
        plt.xlabel('Tiempo')
        plt.ylabel('x')
        plt.title('Ejercicio 5')
        
# =========== LLAMADA FUNCIÓN ===========

Euler(fun,t,p,delmax,dif,numint)