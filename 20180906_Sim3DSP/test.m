young= [458.05,509.63]; %values are for young and old respectively
young2= [458.05,509.63,200,340];
old= [200,340];
group = [young;old];
SEM=[12,12,56,45]; % values for error bars
 figure
hold on
bar(1:2,group)
errorbar([0.86,1.14,1.86,2.14],young2,SEM,'.') %errorbar(x,y,err)