%Suponiendo una variable aleatoria X perteneciente a U[0,1] estimar la
%esperanza de la v.a. X^2+3*X-2 y calcular un intervalo de confianza 95%
%con 100 y 1000 realizaciones de X. Utilizar v.a. antitéticas para reducir
%la varianza y comparar los intervalos de confianza

%Número de realizaciones
n1 = 100;
n2 = 1000;

%Defenimos la función de la variable aleatoria
g = @(x) x.^2 + 3.*x - 2;

%Ejemplo para n1 = 100
X1 = rand(n1,1);
X1_ant = 1 - X1;

Y1 = g(X1);
Y1_ant = g(X1_ant);
V = (Y1 + Y1_ant) / 2;

Y1_media = sum(Y1) / n1;
Y1_ant_media = sum(V) / n1;

sc = sqrt(1/(n1-1)*sum((Y1 - Y1_media).^2));
sc_ant = sqrt(1/(n1-1)*sum((V - Y1_ant_media).^2));

%Cálculo del intervalo de confianza (95%)
z = 1.96; %Valor crítico par el nivel de confianza 95%
CI1 = [Y1_media - z * sc/sqrt(n1), Y1_media + z * sc/sqrt(n1)];
CI1_ant = [Y1_ant_media - z * sc_ant/sqrt(n1), Y1_ant_media + z * sc_ant/sqrt(n1)];

%Repetimos el proceso para n2 = 1000
X2 = rand(n2, 1);
X2_ant = 1-X2;

Y2 = g(X2);
Y2_ant = g(X2_ant);
V2 = (Y2 + Y2_ant) / 2;

Y2_media = sum(Y2) / n2;
Y2_ant_media = sum(V2) / n2;

sc2 = sqrt(1/(n2-1)*sum((Y2 - Y2_media).^2));
sc2_ant = sqrt(1/(n2-1)*sum((V - Y2_ant_media).^2));

CI2 = [Y2_media - z*sc2/sqrt(n2), Y2_media + z*sc2/sqrt(n2)];
CI2_ant = [Y2_ant_media - z*sc2_ant/sqrt(n2), Y2_ant_media + z*sc2_ant/sqrt(n2)];

% Mostrar resultados
disp('--- Resultados para n = 100 ---');
disp(['Media simple: ', num2str(Y1_media)]);
disp(['Intervalo de confianza simple: [', num2str(CI1(1)), ', ', num2str(CI1(2)), ']']);
disp(['Media con antitéticas: ', num2str(Y1_ant_media)]);
disp(['Intervalo de confianza con antitéticas: [', num2str(CI1_ant(1)), ', ', num2str(CI1_ant(2)), ']']);

disp('--- Resultados para n = 1000 ---');
disp(['Media simple: ', num2str(Y2_media)]);
disp(['Intervalo de confianza simple: [', num2str(CI2(1)), ', ', num2str(CI2(2)), ']']);
disp(['Media con antitéticas: ', num2str(Y2_ant_media)]);
disp(['Intervalo de confianza con antitéticas: [', num2str(CI2_ant(1)), ', ', num2str(CI2_ant(2)), ']']);