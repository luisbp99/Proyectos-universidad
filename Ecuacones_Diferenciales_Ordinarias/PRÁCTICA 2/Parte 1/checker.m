function [infoconv, charexp, p] = checker(alph, bet, tol)
    
    if bet(1) ~= 0
        charexp = 'Implícito';
    else
        charexp = 'Explícito';
    end
    p = 0;

    rho1 = polyval(alph, 1);
    if abs(rho1) > tol
        infoconv = 1;
        return
    end

    rhop = polyder(alph);
    rhop1 = sum(rhop);
    sigma1 = sum(bet);
    if abs(rhop1 - sigma1) > tol
        infoconv = 2;
        return
    end

    vr = roots(alph);
    vmr = abs(vr);
    vrone = vr(abs(vmr-1) < tol);
    w = unique(vrone);

    if any(vmr > 1+tol)
        infoconv = 3;
    elseif length(vrone) ~= length(w)
        infoconv = 4;
    else
        infoconv = 5;
        p = order(alph, bet, tol);
    end
end