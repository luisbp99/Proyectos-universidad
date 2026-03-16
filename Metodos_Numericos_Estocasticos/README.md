# Métodos numéricos estocásticos

## Ejercicio 5

Realizar la siguiente práctica sobe simulación

* Utilizar un método de congruencia lineal para generar muestras de una uniforme en $[0,1]$
* Elaborar un programa de MATLAB que genere a partir de ellas muestras de la $\mathcal{N}(\mu ,\sigma ^2)$ a partir de muestra de uniforme generadas con rand de MATLAB
* Elaborar un programa de MATLAB que genere muestras de una normal bidimensional con vector de medias y matriz de covarianzas dados a partir de muestras de uniforme generadas con rand
* Suponiendo que una v.a. $X \in U[0,1]$ estimar la esperanza de la v.a. $X^2+3X-2$ y calcular un intervalo de confianza del 95% con 100 y 1000 realizaciones de X. Utilizar variables antitéticas para reducir la varianza y comparar los intervalos de confianza

## Ejercicio 10

Elaborar un programa de MATLAB para resolver con Euler-Maruyama la EDE estocástica:

$$
dY_t = \alpha (t,Y_t) dt + \beta (t,Y_t) dX_t
$$

conocidas las expresiones de $\alpha$ y $\beta$.

## Ejercicio 11

El modelo de interés a corto propuesto por Cox, Ingersoll y Ross (CIR) se basa en la EDE

$$
dr_t = \alpha(\gamma - r_t) dt + \rho \sqrt{r_t] dX_t
$$

Para $\alpha = 0.2$, $\gamma = 0.05$, $\rho = 0.1$ y $r_0 = 0.04$, mediante los métodos de Euler-Maruyama y Milstein I, obtener con 100 pasos de tiempo los estimadores de $E(r_T)$ con n=10, 100 y 1000 simulacioines para T=1.
