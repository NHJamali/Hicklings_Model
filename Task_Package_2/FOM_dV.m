function FOM_dV(dV)

t=0:0.01:5;
Paw=zeros(1,length(t));
Pa=0;
C=5;
R=3;

for i=0:length(t)-1
    if t(1,i+1)<=1
        dV=dV;
    else
        dV=0;
    end
    dPa=dV/C;
    Pa=Pa+dPa;
    Paw(i+1)=R*dV+Pa;
end
plot(t,Paw)

end