
import pandas as pd
import matplotlib.pyplot as plt

# =========== IMPORTAR DATOS ===========

datos = pd.pandas.read_csv('C:\\Users\\Usuario\\Documents\\universidad\\3º\\Física Computacional\\3_Tratamiento de datos\casos_tecnica_ccaa.csv')

# =========== SELECCIÓN DATOS ===========

datos["fecha"] = pd.to_datetime(datos["fecha"]) 
g = datos["ccaa_iso"] == "GA"
galicia = datos[g] 

# =========== GRÁFICA ===========

fig = plt.figure()
ax = fig.add_subplot(1,1,1)
ax.plot(galicia["fecha"],galicia["num_casos"])
plt.title('Galicia')
plt.xlabel("Fecha")
plt.ylabel("Número de casos")
plt.savefig('Grafica.jpg')