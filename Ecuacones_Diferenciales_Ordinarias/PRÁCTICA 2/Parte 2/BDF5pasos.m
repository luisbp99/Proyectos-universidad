% Resolución numérica del problema vectorial m-dimensional de valor inicial (o de Cauchy) PVI
%
% y'  = f(x,y),   a <= x <= b,
% y(a) = eta,
%
%usando el método de BDF de 5 pasos y el Runge Kutta clásico.
%x(1) = a, x(2),..., x(N-1), x(N) = b.
%
% x es el vector de nodos.
%
% yh es la matriz de aproximaciones: yh(i,j) es la aproximación de y_j(x(i)),
% siendo y(x) = [y_1(x) ... y_m(x)] la solución exacta del PVI. En otras
% palabras, la columna j de yh contiene la aproximación de la j-ésima
% componente de la solución exacta , y_j(x).
%
% dfreq: display frequency (Para no mostrar demasiadas líneas, los resultados se imprimen solo para
% el primer nodo, el último nodo y cuando el número de nodo es un múltiplo de dfreq).
%
% ex: Indica si la solución exacta es conocida (ex=1) o no (otherwise).
%
% ofi: archivo identficador para el archivo de salida(output file).
%
function [m,x,yh] = BDF5pasos(a,b,eta,N,dfreq,ex,ofi,maxit,epsi,delta)
% m es la dimensión del problema:
m = length(eta);
fprintf(ofi,'\nDimensión del problema: m = %-i.', m);
% h es el stepsize (distancia internodal):
h = (b-a)/(N-1);
fprintf(ofi,'\nStepsize: h = (b-a)/(N-1) = %-.15E.', h);
% x vector de nodos:
x = linspace(a,b,N);
%La siguiente línea acelera el calculo ya que
%fija el tamaño de la matriz yh en vez de aumentarlo en cada paso.
yh = zeros(N,m);
% La primera fila de yh es eta
yh(1,:) = eta;

if (ex == 1)
    fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution \t\t Exact solution \t\t\t Error (2-norm)\n');
    exa = exact(x(1));
    error = norm(exa-yh(1,:));
    fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E \t %-.15E \t\t %-.15E',1,x(1),yh(1,1),exa(1),error);
    for j = 2:m
    fprintf(ofi,'\n \t\t\t\t\t\t\t %-.15E \t %-.15E',yh(1,j),exa(j));
    end
else
    fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution\n');
    fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E',1,x(1),yh(1,1));
    for j = 2:m
    fprintf(ofi,'\n \t\t\t\t\t\t\t %-.15E',yh(1,j));
    end
end
%******************************************************++++++++++
%RUNGE KUTTA CLÁSICO. Proporcionará los vectores de arranque para el BDF de
% pasos.
for n=1:4

    k1=f(x(n),yh(n,:));
    k2=f(x(n)+h/2,yh(n,:)+h/2*k1);
    k3=f(x(n)+h/2,yh(n,:)+h/2*k2);
    k4=f(x(n+1),yh(n,:)+h*k3);
    
    yh(n+1,:)=yh(n,:)+h/6*(k1+2*k2+2*k3+k4);

end
% PROGRAMAMOS EL BDF DE 5 PASOS Y SE EMPLEA EL MÉTODO DE NEWTON PARA RESOLVER.
for i=5:N-1 
   xi=x(i); xi1=x(i+1); yh5=yh(i,:);yh4=yh(i-1,:);yh3=yh(i-2,:);yh2=yh(i-3,:);yh1=yh(i-4,:);
   yh(i+1,:)=newtonbdf(h,xi,xi1,yh1,yh2,yh3,yh4,yh5,maxit,epsi,delta);

 %+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
    if (mod(i+1,dfreq) == 0)
        if (ex == 1)
            fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution \t\t Exact solution \t\t\t Error (2-norm)\n');
            exa = exact(x(i+1));
            error = norm(exa-yh(i+1,:));
            fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E \t %-.15E \t\t %-.15E',i+1,x(i+1),yh(i+1,1),exa(1),error);
            for j = 2:m
                fprintf(ofi,'\n \t\t\t\t\t\t\t %-.15E \t %-.15E',yh(i+1,j),exa(j));
            end
        else
            fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution\n');
            fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E',i+1,x(i+1),yh(i+1,1));
            for j=2:m
                fprintf(ofi,'\n \t\t\t\t\t\t\t\t\t\t %-.15E',yh(i+1,j));
            end
        end
    end
end
if (mod(N,dfreq) ~= 0)
    if (ex == 1)
        fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution \t\t Exact solution \t\t\t Error (2-norm)\n');
        exa = exact(x(N));
        error = norm(exa-yh(N,:));
        fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E \t %-.15E \t %-.15E',N,x(N),yh(N,1),exa(1),error);
        for j = 2:m
            fprintf(ofi,'\n \t\t\t\t\t\t\t\t\t\t %-.15E \t %-.15E',yh(N,j),exa(j));
        end
    else
        fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t\t\t Approximate solution\n');
        fprintf(ofi,'%-i \t\t %-.15E \t\t %-.15E',N,x(N),yh(N,1));
        for j = 2:m
            fprintf(ofi,'\n \t\t\t\t\t\t\t\t\t\t %-.15E',yh(N,j));
        end
    end
end

