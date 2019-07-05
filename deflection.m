function P = deflection( x )
    E = 2e11;
   % L = 0.4;
    d = 0.0826;
    h = 0.01;
    I = (h*(d^3))/12;
    q = 10000;
    k = (0.4-x)/0.4;
    V = (q*(0.4^4))*(3-4*k+(k.^4))/(24*E*I);
    P = -1*V*1e3;
end


