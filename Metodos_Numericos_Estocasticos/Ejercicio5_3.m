%Programa que genera muestras de una normal bidimensional con vector de
%medias y matriz de covarianzas dados a partir de muestras de uniforme
%generadas con el comando rand

mu = [5; 2];
sigma = [1; 0.5];
rhop = 0.5;
n = 1000;
Sigma = [sigma(1)^2, rhop*sigma(1)*sigma(2);rhop*sigma(1)*sigma(2), sigma(1)^2];

%Generamos muestras uniformes
U1 = rand(n, 1);
U2 = rand(n, 1);

%Construimos las N(0, 1) a partir de las uniformes
theta = 2*pi * U2;
rho = sqrt(-2*log(U1));

Y1 = rho.*cos(theta);
Y2 = rho.*sin(theta);

Y = [Y1, Y2]';

X1 = mu(1)+sigma(1)*Y1;
X2 = mu(2)+sigma(2)*(rhop*Y1+sqrt(1-rhop^2)*Y2);

X = [X1, X2]';

%Visualización de los resultados

scatter(X(1,:), X(2,:), 10, 'filled');
title('Muestras generadas de N(mu, Sigma)');
xlabel('Variable 1');
ylabel('Variable 2');
grid on;