function dy=FOM(t,y,param)

C=param(1);
R=param(2);

dV=y(1);
dPa=y(2);


dy=zeros(3,1);

dy(1)=dV;
dy(2)=dPa/C;
dy(3)=R*dV+dPa;

end