Pressure_range= [0, 35];
markers= ['x','s','+','v','^','<','>','p','h','.','o'];
m=0;
legend_labels = {};
for TOP= 0:4:12
    m=m+1;
    [pressure, volume]= task1d_func(Pressure_range, TOP);
    plot(pressure,volume,['-',markers(m)])
    hold on
    legend_labels{end+1} = ['TOP = ', num2str(TOP)];
end
legend(legend_labels)