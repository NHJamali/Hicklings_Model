function [volume, pressure]=Hickling(PEEP,PIP,TOP,layers,compPerUnit,unitsPerLayer)

%PEEP= 0;
%PIP= 35;
%TOP= 0;
volume=zeros(1,PIP);
pressure=PEEP:PIP;
%layers=31;
SP=-0.5:0.5:(layers/2-1);
%compPerUnit=0.0002;
%unitsPerLayer=9000;
L_vol=zeros(PIP,31);

for PRESS=PEEP:PIP
    for l=1:layers
        if PRESS > (SP(l)-TOP)
            L_vol(PRESS+1,l)=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
        elseif PIP> (SP(l)+TOP) && PEEP > SP(l)
            L_vol(PRESS+1,l)=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
        else
            L_vol(PRESS+1,l)=0;
        end
        volume(PRESS+1)=sum(L_vol(PRESS+1,l));
    end
    %volume(PRESS+1)=sum(L_vol(PRESS+1,l));
end
plot(pressure, volume)
grid on


end