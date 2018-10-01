load('u1.mat');
load('y1.mat');

u = u';
y = y';


y_zukunft = y(3:972);
u_past(1,:) = u(1,1:970);
u_past(2,:) = u(2,1:970);
u_past(3,:) = u(3,1:970);


u_zukunft(1,:) = u(1,3:972);
u_zukunft(2,:) = u(2,3:972);
u_zukunft(3,:) = u(3,3:972);

input(1,:) = y_zukunft(1,:);
input(2,:) = u_past(1,:);
input(3,:) = u_past(2,:);
input(4,:) = u_past(3,:);

output = u_zukunft;


trainFcn = 'trainbr';
net = feedforwardnet(20,trainFcn); 
net = configure(net,input,output);


net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net,input,output); 
view(net); 
netz_output = net(input);







