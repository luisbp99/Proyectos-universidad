% Function defining the differential equation y' = f(x, y).
%
% This function returns the value of f(x, y) for a given x and vector y.

function vf = f ( x, y )
    % First-Order ODE rewritten from: y'' + y = cos(3*x)
    % vf = [ y(2), -y(1) + cos(3 .* x) ];

    vf = [ 2 .* x .* y(4) .* y(1), 10 .* x .* y(4) .* y(1)^5, 2 .* x .* y(4), -2 .* x .* (y(3) - 1) ];
end