% Exact solution of the initial value problem (IVP).
% 
% This function returns the exact solution for a given IVP at specified points x.

function vexact = exact(x)
    %vexact = 9/8*cos(x) - 1/8*cos(3*x);
    vexact = [ exp(sin(x.^2)), exp(5 .* sin(x.^2)), sin(x.^2) + 1, cos(x.^2) ];
end