PEEP=0;
PIP=35;
TOP=0;
layers=[4 10 20 30];
CompPerUnit=0.0002;
UnitsPerLayers=9000;
figure
for i=1:length(layers)
    [volume,pressure]=BasicHickling(PEEP,PIP,TOP,layers(i),CompPerUnit,UnitsPerLayers);
    plot(pressure,volume)
    grid on
    hold on
end


title('Hickling Model , Different Number of Layers TOP=0')
legend("layers=4","layers=10","layers=20","layers=30")
xlabel("Pressure")
ylabel("Volume")