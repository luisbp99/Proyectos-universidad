%Programa que genera una N(mu, sigma^2) a partir de una muestra uniforme
%U(0,1) generada con el comando rand de matlab

mu = 5;     %Media de la distribución normal a calcular
sigma = 2;  %Desviación estandar de la normal a calcular
n = 1000;   %Número de muestras que generamos

%Generamos las dos muestras uniformes usando el camando rand
U1 = rand(n/2,1);
U2 = rand(n/2,1);

%Calculamos una distribución N(0,1) a partir de las distribuciones
%uniformes usando la transformación de Box-Muller

theta = 2*pi * U2;
rho = sqrt(-2*log(U1));

Y1 = rho.*cos(theta);
Y2 = rho.*sin(theta);

Y = [Y1; Y2];

%Transformamos la N(0,1) en una N(mu,sigma^2)
X = mu + Y*sigma;

%Visualizamos las muestras en un histograma
histogram(X, 30, 'Normalization', 'pdf');
hold on;

%Superponemos la curva de la distribución normal teórica
x_vals = linspace(mu-4*sigma, mu+4*sigma, 100);
pdf_vals = (1 / (sqrt(2*pi) * sigma)) * exp(-(x_vals - mu).^2 / (2 * sigma^2));
plot(x_vals, pdf_vals, 'r', 'LineWidth', 2);
hold off;
title('Muestras generadas vs distribución teórica');
legend('Muestras generadas', 'Distribución teórica');