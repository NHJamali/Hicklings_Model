PEEP=0;
PIP=35;
layers=30;
comPerUnit=0.0002;
unitsPerLayer=9000;



markers= ['x','s','+','v','^','<','>','p','h','.','o'];
m=0;
legend_labels = {};
for TOP= 0:4:12
    m=m+1;
    [pressure, volume]= Hickling(PEEP,PIP,TOP,layers,comPerUnit,unitsPerLayer);
    plot(pressure,volume,['-',markers(m)])
    hold on
    legend_labels{end+1} = ['TOP = ', num2str(TOP)];
end
legend(legend_labels)