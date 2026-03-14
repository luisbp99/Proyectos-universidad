function p = order(alph, bet, tol)
    
    k = length(alph);
    C0 = sum(alph);
    j = k:-1:1;
    C1 = dot(j,alph(1:k))-sum(bet);
    C = zeros(1,100);
    C(1) = C0;
    C(2) = C1;

    for q = 2:20
        if abs(C(q-1)) < tol
            C(q) = ((1/factorial(q))*dot(j.^(q),alph(1:k)))-(1/factorial(q-1))*dot(j.^(q-1),bet(1:k));
        else
            p = q-2;
            break
        end
    end
end
