# Simulación física de materiales

Los programas están orientados a la simulación computacional de materiales a partir de modelos microscópicos, donde se estudia la evolución de un sistema de partículas y se calculan diferentes magnitudes termodinámicas.

## 📂Estructura de los programas principales

Las tres primeras carpetas corresponden a programas que forman parte de un mismo proyecto y que deben ejecutarse de forma secuencial. Cada uno amplía la funcionalidad del anterior.

### 1️⃣ Red fcc

El primer programa genera la estructura inicial del material, creando una red de partículas.

A cada partícula se le asignan:
* Posición
* Momento
* Energía inicial

Este paso define el estado inicial del sistema físico que posteriormente se utilizará en la simulación.

### 2️⃣ Equilibrio

El segundo programa simula la evolución temporal del material a partir del estado inicial generado en el paso anterior. El objetivo es que el sistema evolucione dinámicamente hasta alcanzar el equilibrio termodinámico.

### 3️⃣ Calculo magnitudes

Una vez alcanzado el equilibrio, el tercer programa calcula distintas magnitudes macroscópicas del sistema, como por ejemplo: temperatura, presión y capacidad calorífica. Estas magnitudes permiten analizar el comportamiento del material a partir de la simulación microscópica.

## 📂Trabajos optativos

Además de los programas principales, se incluyen dos carpetas con trabajos optativos relacionadas con la simulación del sistema.

### Comprobación equilibrio

Este programa analiza el sistema generado en la segunda parte con el objetivo de comprobar que el material ha alcanzado el equilibrio. 

### Monte Carlo

Este trabajo implementa un enfoque alternativo basado en el método de Monte Carlo. En este caso se genera el material mediante muestreo estocástico y se calculan diferentes magnitudes termodinámicas del sistema. Este método permite comparar los resultados obtenidos con los de la simulación dinámica. 
