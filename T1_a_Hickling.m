function [volume, pressure]=T1_a_Hickling(PEEP,PIP,opMin,opMax,layers,compPerUnit,unitsPerLayer)

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
        for OPRESS=opMin:opMax
            if PRESS > (SP(l)+OPRESS)
                Crnt_Volume=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
            elseif PIP> (SP(l)+OPRESS) && PEEP > SP(l)
                Crnt_Volume=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
            else
                Crnt_Volume=0;
            end
            L_vol(PRESS+1,l)=Crnt_Volume;
        end
    end
    volume(PRESS+1)=sum(L_vol(PRESS+1,:));
end
plot(pressure, volume)
grid on


end