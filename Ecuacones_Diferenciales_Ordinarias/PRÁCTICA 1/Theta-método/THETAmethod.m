% Numerical resolution of the vector-valued, m-dimensional Initial Value Problem (IVP)
% using the theta method. Such equations can be approximately solved using
% fixed-point or Newton's method.
%
% Special values of theta are:
%       - theta = 0     backward Euler method,
%       - theta = 1/2   trapezoidal method,
%       - theta = 1     forward Euler method.
%
% The IVP is defined as:
% y'  = f(x,y),   a <= x <= b,
% y(a) = eta,
%
% This solution uses N nodes, with the mesh points x(1) = a, x(2),..., x(N-1), x(N) = b.
% x is the vector of nodes.
%
% yh is the matrix of approximations: yh(i,j) is the approximation of y_j at x(i),
% where y(x) = [y_1(x), ..., y_m(x)] is the exact solution of the IVP.
% In other words, column j of yh contains approximations for the j-th component
% of the exact solution, y_j(x).
%
% ofi: file identifier for the output file where results are logged.

function [ m, x, yh ] = THETAmethod ( th, a, b, eta, N, ofi, maxit, epsi, delta, option )

    % m is the dimension of the problem, inferred from the length of the initial condition vector, eta
    m = length(eta);
    fprintf(ofi, '\nDimension of the problem: \nm = %-i.', m);
    
    % h is the step size, computed based on interval length and number of nodes
    h = (b - a) / (N - 1);
    fprintf(ofi, '\n\nStep size: \nh = (b-a)/(N-1) = %-.5E.', h);
    
    % x is the vector of nodes, evenly spaced from a to b
    x = linspace(a, b, N);
    
    % Preallocate matrix yh for efficiency; yh will store solution approximations
    % yh(i, :) is the approximation of y at x(i)
    yh = zeros(N, m);
    
    % Set initial condition: first row of yh corresponds to eta
    yh(1, :) = eta;
    
    % Theta method progression through steps:
    % Update yh at each step using the selected method
    if ( option == 1 ) % Fixed-point

        for i = 1 : N - 1
            yh(i+1,:) = fixedpoint ( th, h, x(i), x(i+1), yh(i,:), maxit, epsi );
        end

    elseif ( option == 2 ) % Newton

        for i = 1 : N - 1
            yh(i+1,:) = newton ( th, h, x(i), x(i+1), yh(i,:), maxit, epsi, delta, m );
        end
        
    else % Otherwise
        error( 'Method %i not supported', option )
    end
end


