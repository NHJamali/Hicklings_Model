function [V,C]=SKM(Vmax,K,C0,pa)

V=Vmax*(1-e^(-pa*K));
C=C0*e^(-pa*K);
end