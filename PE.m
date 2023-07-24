function p = PE(x,ka,kb,La,Lb, F1, F2)
PEa = 0.5*ka*(sqrt(x(1)^2 + (La-x(2))^2)-La)^2;
PEb = 0.5*ka*(sqrt(x(1)^2 + (Lb-x(2))^2)-Lb)^2;
    W = F1*x(1)+F2*x(2);

    p = PEa + PEb - W;

    