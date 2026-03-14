%Programa que resuelve la EDE dada en el ejercicio usando el método de
%Euler-Maruyama y compara la solución del método numérico con la solución
%exacta.

% Parámetros iniciales
T = 1;                  % Tiempo final
N = 1000;               % Número de pasos de tiempo
dt = T / N;             % Paso temporal
t = 0:dt:T;             % Vector de tiempos
Y0 = 1;                 % Condición inicial

% Coeficientes constantes
alpha = 2;              % Coeficiente α
beta = 0.5;             % Coeficiente β

%Calculamos la solución numérica por Euler-Maruyama
Y_euler = zeros(1, N+1);
Y_euler(1) = Y0;
dW = sqrt(dt) * randn(1, N);

% Iteración de Euler-Maruyama
for k = 1:N
    Y_euler(k+1) = Y_euler(k) + alpha * Y_euler(k) * dt + beta * Y_euler(k) * dW(k);
end

% Solución exacta
X_t = [0, cumsum(dW)]; % Proceso de Wiener acumulado
Y_exact = Y0 * exp((alpha - 0.5 * beta^2) * t + beta * X_t);

% Comparar ambas soluciones
figure;
plot(t, Y_exact, 'r', 'LineWidth', 1.5); hold on;
plot(t, Y_euler, 'b--', 'LineWidth', 1.5);
legend('Solución Exacta', 'Euler-Maruyama');
xlabel('Tiempo t');
ylabel('Y_t');
title('Comparación entre la solución exacta y Euler-Maruyama');
grid on;