dV=30;
C=5;
R=5;

[t,dy]=ode45(@(t,y) FOM(t,y,C),[0 1],[0]);

Paw=zeros(length(t),1);
for i=0:length(t)-1
    if t(i+1,1)<=0.1
        dV=0;
    elseif t(i+1,1)<=1.5
        dV=25;
    else
        dV=0;
    end
    Paw(i+1,1)=R*dV+dy(i+1,1);
end
plot(t,Paw)