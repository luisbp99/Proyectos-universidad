% Print elegant formatted output for model parameters to output file ofi

fprintf(ofi, '===========================\n');
fprintf(ofi, '          DATA\n');
fprintf(ofi, '===========================\n\n');

% INITIAL (LEFT) EXTREMUM
a = 0;
fprintf(ofi, '>>> Initial (Left) Extremum:\n');
fprintf(ofi, '    a = %-.5E\n\n', a);

% FINAL (RIGHT) EXTREMUM
b = 5;
fprintf(ofi, '>>> Final (Right) Extremum:\n');
fprintf(ofi, '    b = %-.5E\n\n', b);

% INITIAL CONDITION (VALUE OF THE SOLUTION y(x)=[y_1(x) ... y_m(x)] AT x = a)
eta = 1;
fprintf(ofi, '>>> Initial Condition (y at x = a):\n');
fprintf(ofi, '    eta = [ ');
fprintf(ofi, '%-.5E ', eta);
fprintf(ofi, ']\n\n');

% NUMBER OF POINTS (NODES) OF THE MESH
N = 10000;
fprintf(ofi, '>>> Number of Nodes in Mesh:\n');
fprintf(ofi, '    N = %-i\n\n', N);

% DISPLAY FREQUENCY
dfreq = max(1, round(N / 10));
fprintf(ofi, '>>> Display Frequency:\n');
fprintf(ofi, '    dfreq = %-i\n', dfreq);
fprintf(ofi, '    (Results are displayed for the first node, last node, and when the node number is a multiple of dfreq)\n\n');

% PLOT FREQUENCY
plfreq = max(1, round(N / 50));
fprintf(ofi, '>>> Plot Frequency:\n');
fprintf(ofi, '    plfreq = %-i\n', plfreq);
fprintf(ofi, '    (Points are plotted for the first node, last node, and when the node number is a multiple of plfreq)\n\n');

% EXACT SOLUTION KNOWN (ex = 1) OR UNKNOWN (ex != 1)
ex = 1;
fprintf(ofi, '>>> Exact Solution Known:\n');
fprintf(ofi, '    ex = %-i', ex);
if (ex == 1)
    fprintf(ofi, ' (The exact solution is known)\n\n');
else
    fprintf(ofi, ' (The exact solution is unknown)\n\n');
end

% MAXIMUM ITERATIONS
maxit = 50;
fprintf(ofi, '>>> Maximum Iterations:\n');
fprintf(ofi, '    maxit = %-i\n\n', maxit);

% EPSILON VALUE FOR STOPPING CRITERIA
epsi = 1e-11;
fprintf(ofi, '>>> Epsilon Value for Stopping Criteria:\n');
fprintf(ofi, '    epsi = %-.2E\n\n', epsi);

% DELTA VALUE FOR STOPPING CRITERIA (Only for Newton Method)
delta = 1e-14;
fprintf(ofi, '>>> Delta Value for Stopping Criteria:\n');
fprintf(ofi, '    delta = %-.2E\n\n', delta);

fprintf(ofi, '===========================\n');
fprintf(ofi, '       END OF DATA\n');
fprintf(ofi, '===========================\n');


