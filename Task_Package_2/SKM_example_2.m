t=0:0.01:5;
Paw=zeros(1,length(t));
Pa=0;
C0=0.000371;
R=3;
K=0.1018;

for i=0:length(t)-1
    if t(1,i+1)<=1
        dV=33;
    else
        dV=0;
    end
    C=C_SKM(Pa,C0,K);
    dPa=(dV/C);
    Pa=Pa+dPa;
    Paw(i+1)=R*dV+Pa;
end
plot(t,Paw)