%Programa que resuelve la EDE que describe los tipos de interés a corto
%propuesto por CIR usando el método de Euler-Maruyama y el método MilsteinI
%y compara ambos resultados para 10, 100 y 1000 simulaciones.

% Parámetros del modelo CIR
alpha = 0.2;    % Velocidad de reversión
gamma = 0.05;   % Media de reversión
rho = 0.1;      % Volatilidad
r0 = 0.04;      % Valor inicial
T = 1;          % Tiempo final
N = 100;        % Número de pasos de tiempo
dt = T / N;     % Tamaño del paso de tiempo

% Simulaciones
num_simulations = [10, 100, 1000]; % Diferentes números de simulaciones

% Resultados
fprintf('Método de Euler-Maruyama y Milstein I para el modelo CIR:\n');
for n_sim = num_simulations
    % Inicialización
    r_euler = zeros(n_sim, N + 1);
    r_milstein = zeros(n_sim, N + 1);
    r_euler(:, 1) = r0;
    r_milstein(:, 1) = r0;

    % Simulaciones
    for i = 1:n_sim
        W = sqrt(dt) * randn(1, N); % Incrementos del proceso Wiener
        for j = 1:N
            % Euler-Maruyama
            r_euler(i, j+1) = r_euler(i, j) + alpha * (gamma - r_euler(i, j)) * dt + ...
                rho * sqrt(max(r_euler(i, j), 0)) * W(j);

            % Milstein I
            sqrt_r = sqrt(max(r_milstein(i, j), 0)); % Evitar valores negativos
            r_milstein(i, j+1) = r_milstein(i, j) + alpha * (gamma - r_milstein(i, j)) * dt + ...
                rho * sqrt_r * W(j) + 0.5 * rho^2 * (1 / (2 * sqrt_r)) * (W(j)^2 - dt);
        end
    end

    % Estimadores de E(r_T)
    euler_mean = mean(r_euler(:, end));
    milstein_mean = mean(r_milstein(:, end));

    % Resultados
    fprintf('Número de simulaciones: %d\n', n_sim);
    fprintf('Euler-Maruyama: E(r_T) = %.6f\n', euler_mean);
    fprintf('Milstein I:     E(r_T) = %.6f\n\n', milstein_mean);
end