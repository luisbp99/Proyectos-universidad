% Solución exacta del problema de valor inicial.
function vexact = exact(x)
% vexact = [(9/8).*cos(x)-(1/8).*cos(3.*x),-(9/8).*sin(x)+(3/8).*sin(3.*x)];
%vexact = [exp(sin(x.^2)),exp(5.*sin(x.^2)),sin(x.^2)+1,cos(x.^2)];
vexact = 2./(exp(-x)+exp(x));
% vexact = exp(-1e6.*x)+sin(x);
end