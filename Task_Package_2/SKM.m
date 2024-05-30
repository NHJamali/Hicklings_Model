function [V,C]=SKM(Vmax,K,C0,pa)

V=Vmax*(1-exp(-pa*K));
C=C0*exp(-pa*K);
end