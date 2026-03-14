# Ejercicios de Servidor-Cliente y Método Monte Carlo

En esta carpeta se incluyen dos ejercicios de programación relacionados con la comunicación en red y los métodos numéricos.

## 1. Servidor-Cliente Eco

El objetivo de este ejercicio es implementar un sistema básico de comunicación **cliente-servidor**.

### Descripción

Un **servidor eco (Echo server)** es un servidor que recibe un mensaje enviado por un cliente y devuelve exactamente el mismo mensaje al cliente.

El sistema está compuesto por dos programas:

- **Servidor**
  - Espera conexiones entrantes de clientes.
  - Recibe los mensajes enviados por el cliente.
  - Devuelve al cliente el mismo mensaje recibido.

- **Cliente**
  - Se conecta al servidor.
  - Envía un mensaje al servidor.
  - Recibe y muestra el mensaje devuelto por el servidor.

### Objetivo

Este ejercicio permite comprender conceptos básicos como:

- Programación con sockets
- Arquitectura cliente-servidor
- Comunicación entre procesos a través de red

---

## 2. Aproximación de π mediante el método de Monte Carlo

Este ejercicio utiliza el **método de Monte Carlo** para aproximar el valor del número π.

### Descripción

El método se basa en el uso de **muestreo aleatorio**. El procedimiento es el siguiente:

1. Se generan puntos aleatorios dentro de un cuadrado de lado 2.
2. Dentro del cuadrado se considera una circunferencia de radio 1.
3. Se cuentan los puntos que caen dentro de la circunferencia.

El valor de π puede aproximarse mediante la relación:

π ≈ 4 × (número de puntos dentro del círculo / número total de puntos)

### Objetivo

El propósito de este ejercicio es:

- Comprender el método de Monte Carlo
- Utilizar generación de números aleatorios
- Aproximar constantes matemáticas mediante simulación

---

## Contenido de la carpeta

En esta carpeta se incluyen:

- Implementación del **servidor eco**
- Implementación del **cliente eco**
- Programa de simulación **Monte Carlo para aproximar π**
