% Print elegant formatted output for model parameters to output file ofi

fprintf(ofi, '===========================\n');
fprintf(ofi, '          DATA\n');
fprintf(ofi, '===========================\n\n');

%Vector alpha

alph = [1 -1];
fprintf(ofi, '>>> Vector de las alfas:\n');
fprintf(ofi, '    alfa = [ ');
fprintf(ofi, '%-.6f ', alph);
fprintf(ofi, ']\n\n');
%Vecto beta

bet = [1 1];
fprintf(ofi, '>>> Vector de las betas:\n');
fprintf(ofi, '    beta = [ ');
fprintf(ofi, '%-.6f ', bet);
fprintf(ofi, ']\n\n');

%Tolerancia

tol = 1e-10;
fprintf(ofi, '>>> Tolerancia:\n');
fprintf(ofi, '    tol = %-.5E\n\n', tol);