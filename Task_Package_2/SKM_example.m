P=0:27;
h=6.81;
Vmax=3.46;
V=Vmax*(1-exp(-(P*log(2)/h)));
subplot(2,1,1)
plot(P,V)
xlabel("Pressure (Cm H2O)")
ylabel("Volume (Liters)")
title("P-V curve SKM")

C=zeros(1,27);
for i=0:26
    C(i+1)=(V(i+2)-V(i+1))/(P(i+2)-P(i+1));
end
hold on
subplot(2,1,2)
plot(P(2:end),C)
xlabel("Pressure (Cm H2O)")
ylabel("Compliance")
title("Change in Compliance-SKM")