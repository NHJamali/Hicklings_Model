P=0:27;
h=6.81;
Vmax=3.46;
V=Vmax*(1-exp(-(P*log(2)/h)));
subplot(2,1,1)
plot(P,V)
xlabel("Pressure (Cm H2O)")
ylabel("Volume (Liters)")
title("P-V curve SKM")
grid on

C=zeros(1,27);
for i=0:26
    C(i+1)=(V(i+2)-V(i+1))/(P(i+2)-P(i+1));
end
subplot(2,1,2)
plot(P(2:end),C,"Marker","+")
xlabel("Pressure (Cm H2O)")
ylabel("Compliance (L/cm H2O)")
title("Change in Compliance-SKM")


hold on
C_skm=C_SKM(P,0.371,0.1018);
plot(P,C_skm)
grid on

%Pa=dV/C_skm;
%Paw=R*dV+Pa;