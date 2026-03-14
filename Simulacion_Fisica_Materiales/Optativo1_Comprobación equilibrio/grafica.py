
import pandas as pd
import matplotlib.pyplot as plt

datos = pd.pandas.read_csv('C:\\Users\\Usuario\\Desktop\\universidad\\4º\\Simulación física de materiais\\Optativo1_Comprobación equilibrio\\Proyecto\\Debug\\x64\\resultado.dat',header=None,delimiter="  ")

vel = datos[0]
distvx = datos[1]
distvy = datos[2]
distvz = datos[3]

fig = plt.figure()

ax = fig.add_subplot()
ax.plot(vel,distvx,color='black')