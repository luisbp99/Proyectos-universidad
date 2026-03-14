% INITIAL (LEFT) EXTREMUM:
% Define the starting point of the interval, a, and output it to the file
fprintf(ofi, '***** DATA *****');
a = pi;
fprintf(ofi, '\n* Initial (left) extremum: \na = %-.5E.', a);

% FINAL (RIGHT) EXTREMUM:
% Define the endpoint of the interval, b, and output it to the file
b = 2 * pi;
fprintf(ofi, '\n\n* Final (right) extremum: \nb = %-.5E.', b);

% INITIAL CONDITION (VALUE OF THE SOLUTION y(x)=[y_1(x) ... y_m(x)] AT x = a):
% Define the initial condition (eta) as the value of y at x = a
% eta could be a vector (e.g., [1,1,1,1]) or a scalar; adjust as needed
eta = [exp(-1), 0];
% eta = 1;
% eta = [1, 1, 1, 1];
fprintf(ofi, '\n\n* Initial condition: \neta = ');
fprintf(ofi, '%-.5E ', eta);

% NUMBER OF POINTS (or NODES) OF THE MESH (= NUMBER OF SUBINTERVALS + 1):
% Define the number of nodes for the mesh grid, N, and output it to the file
% N also represents the number of solution points along [a, b]
N = 100;
fprintf(ofi, '\n\n* Number of nodes of the mesh: \nN = %-i. ', N);

% DISPLAY FREQUENCY:
% Specify the display frequency, dfreq, to control how often results are printed
% Results are shown for the first node, the last node, and when node number is a multiple of dfreq
dfreq = max(1, round(N / 10));
fprintf(ofi, '\n\n* Display frequency: \ndfreq = %-i ', dfreq);
fprintf(ofi, '(to avoid displaying too many lines, results are shown only for');
fprintf(ofi, '\nthe first node, the last node, and when node number is a multiple of dfreq).');

% PLOT FREQUENCY:
% Specify the plot frequency, plfreq, to control how often points are plotted
% Points are plotted for the first node, the last node, and when node number is a multiple of plfreq
plfreq = max(1, round(N / 50));
fprintf(ofi, '\n\n* Plot frequency: \nplfreq = %-i ', plfreq);
fprintf(ofi, '(to avoid plotting too many points, results are plotted only for');
fprintf(ofi, '\nthe first node, the last node, and when node number is a multiple of plfreq).');

% EXACT SOLUTION KNOWN (ex = 1) OR UNKNOWN (ex != 1):
% Specify whether the exact solution is known (ex = 1) or unknown (ex != 1)
ex = 1;
fprintf(ofi, '\n\n* Option for exact solution: \nex = %-i', ex);
if (ex == 1)
    fprintf(ofi, ' (the exact solution is known).');
else
    fprintf(ofi, ' (the exact solution is not known).');
end