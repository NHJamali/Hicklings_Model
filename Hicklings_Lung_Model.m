function [pressure, volume] =Hicklings_Lung_Model(press_range,opmin,opmax)
%ALV=0.0002;
%REM=27000*ALV;
PIP=press_range(2);
PEEP=press_range(1);
volume=[];
pressure=[];
for press=PEEP:PIP
    voltot=0;
    for sp= -0.5:0.5:14.5
        for opress=opmin:opmax
            if press> (sp+opress)
                vol=(press - sp)*9000*0.0002/(1+opmax-opmin);
                %vol=2*vol-0.12*vol^1.7;
            elseif PIP > (sp+opress) && PEEP > sp
                vol=(press-sp)*9000*0.0002/(1+opmax-opmin);
                %vol=2*vol-0.12*vol^1.7;
            else
                vol=0;
            end
            voltot=voltot+vol;    
        end
        
    end
    voltot2=voltot;
    volume(end +1)=voltot;
    pressure(end+1)=press;
    
end
plot(pressure,volume,'Marker','o')
hold on
grid on
               