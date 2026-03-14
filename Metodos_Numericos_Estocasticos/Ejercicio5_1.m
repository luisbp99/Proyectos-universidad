%Programa que utiliza un método de congruencia lineal para generar muestras
%   de una uniforme en [0,1]
% Para ello elegimos un número natural N0 (semilla)
% Para i=1,2,... se calcula Ni = (aNi-1+b)modM
% Las muestras de la distribución uniforme son Ui = Ni / M

M = 2^31-1;
a = 16807;
b = 0;
x0 = 1;    %Semilla 
n = 1000;  %Número de muestras que se generan

%Inicializamos las variables X y U como vectores de ceros de dimensión n
X = zeros(1, n);
U = zeros(1, n);

X(1) = x0;

for i =2:n
    X(i) = mod(a * X(i-1) + b , M);
end

U = X / M;

%Mostramos en pantalla algunas de las muestras calculadas. 
disp(U(1:10))