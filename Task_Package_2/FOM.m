function [t,dy]=FOM(t,y,C)

if t<=0.01
    dV=0;
elseif t<=1.5
    dV=25;
else 
    dV=0;
end
dy=zeros(3,1);
dy(1)=dV;
dy(2)=dy(1)/C;
dy(3)=3*dy(1)+y(1);
a=3;

end