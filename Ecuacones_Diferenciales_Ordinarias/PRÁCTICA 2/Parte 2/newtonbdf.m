function [ yhn ] = newtonbdf(h,xi,xi1,yh1,yh2,yh3,yh4,yh5,maxit,epsi,delta);
%Función para obter la solución por medio del
%método de Newton.

yh0=yh5+h*f(xi,yh5); %vector inicial.
m=length(yh5);

for i=1:maxit
    
    F= (60/137)*h*f(xi1,yh0)-yh0+(300/137)*yh5-(300/137)*yh4+(200/137)*yh3-(75/137)*yh2+(12/137)*yh1; %SUSTITUYO yhi por la ec. del BDF
    DF =eye(m)- (60/137)*h*jacf(xi1,yh0);           % Calculo el jacobiano, como la función es F(y)=y-g(y)=> DF(y)=I-Dg(y).
   
                                                    % Del método de Newton vectorial se llega a la expresión y_q+1=y_q-(DF(y_q)^-1)*(F(y_q)). 
    W = (DF\F') ;                                   % Operando se llega a DF(y_q)*(y_q+1-y_q)=-F(y_q), definimos  W=y_q+1-y_q, y se resuelve el sistema.  
    yhn = W' + yh0;                                 %Conocida W se puede obtener el término siguiente. 
    
   
    if (norm(yhn-yh0)/(1+norm(yhn)) < epsi & norm(F)/(1+norm(yhn))<delta)
        return    
    end
     
yh0 = yhn; %Se renombra y se repite el bucle.

if(i==maxit)
       disp('No se cumple el test epsilon o el test delta');
end


end
