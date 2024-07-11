function [volume, pressure]=BasicHickling(PEEP,PIP,TOP,layers,compPerUnit,unitsPerLayer)

volume=zeros(1,PIP);
pressure=PEEP:PIP;
SP=-0.5:0.5:(layers/2-1);
L_vol=zeros(PIP,31);

for PRESS=PEEP:PIP
    for l=1:layers
        if PRESS > (SP(l)+TOP)
            Crnt_Volume=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
        elseif PIP> (SP(l)+TOP) && PEEP > SP(l)
            Crnt_Volume=(PRESS-SP(l))*unitsPerLayer*compPerUnit;
        else
            Crnt_Volume=0;
        end
        L_vol(PRESS+1,l)=Crnt_Volume;
    end
    volume(PRESS+1)=sum(L_vol(PRESS+1,:));
end
end