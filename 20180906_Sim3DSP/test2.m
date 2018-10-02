load('u1.mat');
load('input.mat');


u = u';



trainFcn = 'trainlm';
net = feedforwardnet(20,trainFcn); 

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net,y1,u); 
view(net); 
netz_output = net(y1);

