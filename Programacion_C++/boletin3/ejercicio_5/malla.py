import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.spatial import Delaunay

def dibujar_triangulo(p1, p2, p3):
    # Extraemos las coordenadas de los puntos
    x = [p1[0], p2[0], p3[0], p1[0]]  # Cerramos el triángulo volviendo al primer punto
    y = [p1[1], p2[1], p3[1], p1[1]]
    
    # Dibujamos el triángulo
    plt.plot(x, y, 'b-', linewidth=2)  # Línea azul para el triángulo
    
    # Opcional: dibujamos los puntos
    plt.scatter([p1[0], p2[0], p3[0]], [p1[1], p2[1], p3[1]], color='red', zorder=5)
    
    # Configuración del gráfico
    plt.title("Malla")
    plt.grid(True)
    plt.gca().set_aspect('equal', adjustable='box')  # Para mantener la relación de aspecto
    plt.show()

# Leer el archivo con pandas
filename = "points.txt"
df = pd.read_csv(filename, delim_whitespace=True, skiprows=1, names=["x", "y"])  # Saltar la primera línea y leer coordenadas

# Convertir a array de NumPy
points = df.to_numpy()

#Representación gráfica de los elementos de la malla
dibujar_triangulo(points[0], points[1], points[3])
dibujar_triangulo(points[1], points[4], points[3])
dibujar_triangulo(points[1], points[2], points[4])
dibujar_triangulo(points[2], points[5], points[4])
dibujar_triangulo(points[3], points[4], points[6])
dibujar_triangulo(points[4], points[7], points[6])
dibujar_triangulo(points[4], points[5], points[7])
dibujar_triangulo(points[5], points[8], points[7])
