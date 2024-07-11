PEEP=0;
PIP=35;
TOP=0;
layers=30;
CompPerUnit=0.0002;
UnitsPerLayers=9000;

[volume,pressure]=BasicHickling(PEEP,PIP,TOP,layers,CompPerUnit,UnitsPerLayers);

figure
plot(pressure,volume)
grid on
title('Basic Hickling Model, TOP=0, layers=30')
xlabel("Pressure")
ylabel("Volume")