
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.optimize as so

# =========== IMPORTAR DATOS ===========

datos = pd.pandas.read_csv('C:\\Users\\Usuario\\Documents\\universidad\\3º\\Física Computacional\\3_Tratamiento de datos\casos_tecnica_ccaa.csv')

# =========== SELECCIÓN DE DATOS ===========

datos["fecha"] = pd.to_datetime(datos["fecha"]) 

#Datos para el ajuste, fecha entre el 1-03 y el 1-07
datos_ajuste = datos[datos.fecha.between('2020-03-01','2020-07-01')]
g_ajuste = datos_ajuste['ccaa_iso'] == 'GA'
galicia_ajuste = datos_ajuste[g_ajuste]

#Datos representación gráfica desde el 1-01-2020 hasta 4-03-2021
g = datos['ccaa_iso'] == 'GA'
galicia = datos[g]

#Para hacer el ajuste las x serán el número de días desde el 1-03
x_ajuste = np.linspace(1,123,123)

# =========== FUNCIÓN DEL AJUSTE ===========

def f(x,A,r,u):
    y = A/(x*r*np.sqrt(2*np.pi))*np.exp(-(np.log(x)-u)**2/(2*r**2))
    return y

# =========== AJUSTE ===========

popt, pcov = so.curve_fit(f,x_ajuste,galicia_ajuste['num_casos'])

y = f(x_ajuste,popt[0],popt[1],popt[2])

# =========== GRÁFICA ===========

fig = plt.figure()

ax = fig.add_subplot(1,2,1)
ax.plot(galicia['fecha'],galicia['num_casos'])
plt.title('Galicia')
plt.xlabel('Fecha')
plt.ylabel('Número de casos')

ax2 = fig.add_subplot(1,2,2)
ax2.plot(x_ajuste,galicia_ajuste["num_casos"], label='Datos')

ax3 = fig.add_subplot(1,2,2)
ax3.plot(x_ajuste, y, label='Curva de ajuste',color='green')
ax3.legend()
plt.title('Ajuste datos del 1-03-2020 hasta el 1-07-2020')
plt.xlabel("Día")
plt.ylabel("Número de casos")