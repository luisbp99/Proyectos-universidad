% los resultados se grafican solo para el primer nodo, el último nodo 
% y cuando el número de nodo es un múltiplo de plfreq

if (ex==1)
    exa = zeros(N,m);
    for i=1:N
        exa(i,:) = exact(x(i));
    end
end
if (plfreq==1)
    for k=1:m
        figure
        hold on
        plot(x,yh(:,k),'*r')
%             if (metodo == 1)
%                 str=sprintf('Solución aproximada (método de punto fijo), componente %i',k);
%                 legend(str)
%         elseif (metodo==2)
                 str=sprintf('Solución aproximada (método de Newton), componente %i',k);
                 legend(str)
%            end
% La gráfica de la solución exacta se creará solo en casa de que la
% solución exacta sea conocida.

        if (ex==1)
%             if (metodo==1)
%                 plot(x,exa(:,k),'ob')
%                 str1=sprintf('Solución aproximada (método de punto fijo), componente %i',k);
%                 str2=sprintf('Solución exacta, componente %i',k);
%                 legend(str1,str2)
%             elseif (metodo==2)
                 plot(x,exa(:,k),'ob')
                 str1=sprintf('Solución aproximada (método de Newton), componente %i',k);
                 str2=sprintf('Solución exacta, componente %i',k);
                 legend(str1,str2)
%             end    
        end
%         hold off
    end
else
    xpl = x(plfreq:plfreq:N);
    xpl = [x(1),xpl];
    if (mod(N,plfreq)~=0)
        xpl = [xpl,x(N)];
    end
    for k = 1:m
        yhpl = yh(plfreq:plfreq:N,k)';
        yhpl = [yh(1,k),yhpl];
        if (mod(N,plfreq)~=0)
            yhpl = [yhpl,yh(N,k)];
        end
        figure
        hold on
        plot(xpl,yhpl,'*r')
        
%             if (metodo==1)
%                 str = sprintf('Solución aproximada (método de punto fijo), componente %i',k);
%                 legend(str)
%             elseif (metodo==2)
                 str = sprintf('Solución aproximada (método de Newton), componente %i',k);
                 legend(str)
%             end
% La gráfica de la solución exacta se creará solo en casa de que la
% solución exacta sea conocida.
        if (ex==1)
            exapl = exa(plfreq:plfreq:N,k)';
            exapl = [exa(1,k),exapl];
            if (mod(N,plfreq)~=0)
                exapl = [exapl,exa(N,k)];
            end
            plot(xpl,exapl,'ob')
%                 if (metodo==1)
%                     str1 = sprintf('Solución aproximada (método de punto fijo), componente %i',k);
%                     str2 = sprintf('Solución exacta, componente %i',k);
%                     legend(str1,str2)
%                 elseif (metodo==2)
                     str1 = sprintf('Solución aproximada (método de Newton), componente %i',k);
                     str2 = sprintf('Solución exacta, componente %i',k);
                     legend(str1,str2)
%                 end
        end
        hold off
    end
end