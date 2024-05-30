
t = 0:0.01:5; 

Pa = 0; % Initial alveolar pressure (cmH2O)
C = 5; % Compliance (ml/cmH2O)
R = 3; % Resistance (cmH2O*s/ml)

Paw = FOM(t, Pa, C, R);

figure;
plot(t, Paw,"LineWidth",2);
xlabel('Time (seconds)');
ylabel('Airway Pressure (cmH2O)');
title('Airway Pressure vs Time with Constant Compliance');
grid on;

function Vdot = flow_rate(t)
    
    if t <= 1
        Vdot = 25; % Flow rate is 25 ml/s for the first second
    else
        Vdot = 0; % Flow rate is 0 ml/s after the first second
    end
end

function Paw = FOM(t, Pa, C, R)
    Paw = zeros(1, length(t));
    
  
    for i = 1:length(t)
      
        Vdot = flow_rate(t(i)); 
       
        
        dPa = Vdot / C;
        
        Pa = Pa + dPa;
        
        Paw(i) = R * Vdot + Pa; 
    end
end
