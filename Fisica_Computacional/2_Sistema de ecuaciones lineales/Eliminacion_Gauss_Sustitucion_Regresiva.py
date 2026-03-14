
import numpy as np

# =========== DATOS DE ENTRADA ===========
#matriz de coeficientes
a = np.array([[1,2,-1],[2,4,5],[3,-1,-2]],float)
#vector columna de los términos independientes
b = np.array([[2],[25],[-5]],float)

ab = np.concatenate((a,b),axis=1)

# =========== FUNCIONES ===========

def pivoteo_total(matriz,indice):
    M = np.copy(matriz)
    F,C = np.shape(M)
    temp = np.copy(M[indice])
    a = M[indice,indice]
    indice_F, indice_C = indice, indice
    for i in range(indice,F):
        for j in range(i,F):
            if abs(a) < abs(M[i][j]):
                a = M[i][j]
                indice_F = i
                indice_C = j
    #cambio de filas
    M[indice] = M[indice_F]
    M[indice_F] = temp
    #trasponemos la matriz
    M = np.transpose(M)
    temp = np.copy(M[indice])
    M[indice] = M[indice_C]
    M[indice_C] = temp
    M = np.transpose(M)
    return M, indice_C

def eliminacion_gaussiana(matriz):
    M = np.copy(matriz)
    cambio_col = []
    F,C = np.shape(M)
    for i in range(F):
        M, col = pivoteo_total(M,i)
        cambio_col.append((i,col))
        for j in range(i+1,F):
            M[j] -= (M[j,i]/M[i,i])*M[i]
    return M, cambio_col

def sustitucion_regresiva(matriz,cambios):
    F,C = np.shape(matriz)
    x = np.zeros((F,1))
    for i in range(F-1,-1,-1):
        s = 0.0
        for j in range(i,F):
            s += matriz[i,j]*x[j]
        x[i] = (matriz[i,F] -s)/matriz[i,i]
    for i in range(len(cambios)-1,-1,-1):
        temp = np.copy(x[cambios[i][0]])
        x[cambios[i][0]] = x[cambios[i][1]]
        x[cambios[i][1]] = temp
    return x

# =========== PROGRAMA ===========

matriz_triangular, cambio_col = eliminacion_gaussiana(ab)
sol = sustitucion_regresiva(matriz_triangular, cambio_col)

for i in range(len(sol)):
    print('x(%i) = %.5f' %(i+1,sol[i]))    