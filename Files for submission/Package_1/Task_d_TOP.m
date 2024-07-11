PEEP=0;
PIP=35;
TOP=[0 6 12 15];
layers=30;
CompPerUnit=0.0002;
UnitsPerLayers=9000;
figure
for i=1:length(TOP)
    [volume,pressure]=BasicHickling(PEEP,PIP,TOP(i),layers,CompPerUnit,UnitsPerLayers);
    plot(pressure,volume)
    grid on
    hold on
end


title('Hickling Model (Different TOP) layers=30')
legend("TOP=0","TOP=6","TOP=12","TOP=15")
xlabel("Pressure")
ylabel("Volume")