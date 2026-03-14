tic
clc
clear
close all
ofi = fopen('output.txt', 'wt');

data

fprintf(ofi,'\n\n**** COMPUTATION ****');
[infoconv, charexp, p] = checker(alph, bet, tol);
fprintf(ofi, '\n >>> Convergencia:\n');
fprintf(ofi, '%d \n', infoconv);
fprintf(ofi, '\nSi obtenemos un 1 no es consistente porque rho1 ~= 0');
fprintf(ofi, '\nSi obtenemos un 2 no es consistente porque rhop1 ~= sigma1');
fprintf(ofi, '\nSi obtenemos un 3 es consistente pero no estable porque hay raíces con módulo mayor que uno');
fprintf(ofi, '\nSi obtenemos un 4 es consistente pero no estable porque hay alguna múltiple de módulo uno');
fprintf(ofi, '\nSi obtenemos un 5 es convergente\n\n');
fprintf(ofi, '\n >>> ¿Método explícito o implícito?\n');
fprintf(ofi, '%s \n\n', charexp);
fprintf(ofi, '\n >>> Orden del método:\n');
fprintf(ofi, '%d \n\n', p);
fclose(ofi);
toc