% BDF5pasos
% profile on
% profile clear
tic
clc
clear
close all
% ofi STANDS FOR "output file"
ofi = fopen('output.txt','wt');
%
data
%
fprintf(ofi,'\n\n**** COMPUTATION ****');
[m,x,yh] = BDF5pasos(a,b,eta,N,dfreq,ex,ofi,maxit,epsi,delta);
fclose(ofi);
%
plotter
%
toc
% profile off
% profile report