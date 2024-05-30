P=0:27;
h=6.81;
K=0.1018;
C0=0.371;
Vmax=3.46;

[V,C]=SKM(Vmax,K,C0,P);
figure
plot(P,V,"LineWidth",2,"Marker","*")
xlabel("Pressure (Cm H2O)")
ylabel("Volume (Liters)")
title("P-V curve SKM")
grid on

%C=zeros(1,27);
%for i=0:26
%    C(i+1)=(V(i+2)-V(i+1))/(P(i+2)-P(i+1));
%end
figure
plot(P,C,"Marker","+","LineWidth",2)
xlabel("Pressure (Cm H2O)")
ylabel("Compliance (L/cm H2O)")
title("Change in Compliance-SKM")


hold on
%C_skm=C_SKM(P,0.371,0.1018);
%plot(P,C_skm)
grid on
plot(P(2:end),diff(V),"Marker","o","LineWidth",1.5)