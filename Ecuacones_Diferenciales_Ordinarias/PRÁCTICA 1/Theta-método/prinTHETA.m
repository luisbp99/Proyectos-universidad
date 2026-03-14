% THETA METHOD
% Solves the IVP y' = f(x,y), a <= x <= b, with initial condition y(a) = eta in R^m.
tic  % Start the timer
clc  % Clear command window
clear  % Clear all variables
close all  % Close all figure windows

% Open the output file (ofi stands for "output file") in write mode
ofi = fopen('output.txt', 'wt');

% Load problem data (parameters, initial conditions, and function definitions)
data

% Print header for the computation section in the output file
fprintf(ofi, '\n\n**** COMPUTATION ****');

% Call the Theta method function (THETAmethod) to approximate the solution
% Inputs: 
%   theta value, interval [a, b], initial condition eta, number of
%   steps N, output file, maximum number of iterations maxit, epsilon value,
%   delta value, convergence method (fixed-point or Newton's)
% Outputs: 
%   m (dimension of the system), x (mesh points), yh (solution at each point)
[ m, x, yh ] = THETAmethod ( th, a, b, eta, N, ofi, maxit, epsi, delta, option );

% Display results in the command window (calls an external script)
displayer

% Close the output file after computation
fclose(ofi);

% Plot the results (calls an external script to visualize the solution)
plotter

% Display the total execution time
toc