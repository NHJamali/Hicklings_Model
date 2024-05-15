function hicklingmodel(Pressure_range, TOP)
PEEP= Pressure_range(1);
PIP= Pressure_range(2);
volume=[];
pressure=[];
%Pressure_range= [PEEP, PIP];
for PRESS=PEEP:PIP 
VOLTOT=0; 
  for SP= -0.5:0.5:14.5
    if PRESS>(SP+TOP)
      VOL=(PRESS-SP)*9000*0.0002;

    elseif PIP>(SP+TOP)&&PEEP>SP 
      VOL=(PRESS-SP)*9000*0.0002;
      
    else
      VOL=0;
    end
    VOLTOT=VOLTOT+VOL;
  end
volume(end+1)=VOLTOT;
pressure(end+1)=PRESS;
end
%display(volume);
%display(pressure);
plot(pressure, volume)