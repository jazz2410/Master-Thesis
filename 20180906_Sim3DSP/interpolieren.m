load('u1.mat');
load('y1.mat');

u = u';
y = y';
a = linspace(1,972,972);
a_l = linspace(1,972,9720);

u_l(1,:) = interp1(a,u(1,:),a_l);
u_l(2,:) = interp1(a,u(2,:),a_l);
u_l(3,:) = interp1(a,u(3,:),a_l);
y_l = interp1(a,y,a_l);
trainFcn = 'trainbr';
net = feedforwardnet(10,trainFcn); 
net = configure(net,u_l,y_l);

%Setup Division of Data for Training, Validation, Testing
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net,u_l,y_l); 
%view(net); 
netz_output = net(u_l);

time1 = linspace(1,972,9720);
time2 = linspace(1,972,972);
figure(1)
plot(time1,y_l,'bo');
hold  on;
plot(time1,netz_output(1,:),'r.');

figure(2)
subplot(3,1,1)
plot(time2,u(1,:),'ro');
hold on;
plot(time1,u_l(1,:),'b.');

subplot(3,1,2)
plot(time2,u(2,:),'ro');
hold on;
plot(time1,u_l(2,:),'b.');

subplot(3,1,3)
plot(time2,u(3,:),'ro');
hold on;
plot(time1,u_l(3,:),'b.');





