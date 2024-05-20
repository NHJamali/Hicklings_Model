function Paw=FOM(C,dV)
dPa=dV/C;

Paw=R*dV+Pa;


dy=[y(1);
    y(1)/C];
Paw=R*y(1)+y(2);
end