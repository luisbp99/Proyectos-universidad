# Redes de computadores y computación distribuida

Los programas de esta carpeta están orientados al aprendizaje de comunicación cliente-servidor, programación con sockets y desarrollo de aplicaciones distribuidas.

## 📂ServidorClienteEco

En esta carpeta se implementa una aplicación básica de comunicación cliente-servidor tipo eco. El sistema está compuesto por dos programas: un cliente y un servidor. El cliente envía un mensaje al servidor y este lo devuelve escrito ahora todo en letras mayúsculas. Se implementan dos versiones del sistema: una basada en coneción TCP y otra basada en conexión UDP. 

## 📂Monte Carlo

En esta carpeta se desarrolla una aplicación cliente-servidor para aproximar el valor del número $\pi$ mediante el método de Monte Carlo. El sistema se basa en la generación de puntos aleatorios en el plano. Para ello se diseña un objeto servidor que, dado un número (n) de pares ordenados generados aleatoriamente, calcula cuántos el número de puntos (m) que se encuentran dentro del círculo de radio unidad. Se diseña también un objeto cliente que hace uso del servidor para obtener el valor de m y calcular así una aproximación de $\pi$. 

## 📂Monte Carlo Paralelo 

En esta carpeta se desarrolla una versión paralela del programa anterior. En este caso el cliente puede comunicarse en paralelo con múltiples objetos servidores. El trabajo de generación y evaluación de puntos se reparte entre varios servidores y los resultados obtenidos por cada servidor se agrupan para calcular una aproximación global de $\pi$. Para gestionar estas comunicaciones simultáneas se utilizan hilos de ejecución (threads).
