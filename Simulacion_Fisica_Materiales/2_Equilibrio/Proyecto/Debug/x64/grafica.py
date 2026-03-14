
import pandas as pd
import matplotlib.pyplot as plt

datos = pd.pandas.read_csv('C:\\Users\\Usuario\\Desktop\\universidad\\4º\\Simulación física de materiais\\2_Equilibrio\\Proyecto\\Release\\x64\\energias-tiempo.txt',header=None,delimiter="  ")

tiempo = datos[0]
etot = datos[1]
ecin = datos[2]
epot = datos[3]

fig = plt.figure()

ax = fig.add_subplot()
ax.plot(tiempo,etot,label='Energia total')
#ax.plot(tiempo,ecin,label='Energia cinetica')
#ax.plot(tiempo,epot,label='Energia potencial')

ax.legend()
plt.xlabel('Tiempo')
plt.ylabel('Energia')

