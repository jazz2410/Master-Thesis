load('Versuch1.mat')

len = length(press_z);


u1(1,:) = pos_SpO(:,1);
u1(2,:) = pos_SpU(:,1);
u1(3,:) = pos_drives(:,1);
y1(1,:) = press_z(:,1);
load('Versuch2.mat')

u2(1,:) = pos_SpO(:,1);
u2(2,:) = pos_SpU(:,1);
u2(3,:) = pos_drives(:,1);
y2(1,:) = press_z(:,1);
load('Versuch3.mat')

u3(1,:) = pos_SpO(:,1);
u3(2,:) = pos_SpU(:,1);
u3(3,:) = pos_drives(:,1);
y3(1,:) = press_z(:,1);
load('Versuch4.mat')

u4(1,:) = pos_SpO(:,1);
u4(2,:) = pos_SpU(:,1);
u4(3,:) = pos_drives(:,1);
y4(1,:) = press_z(:,1);
load('Versuch5.mat')

u5(1,:) = pos_SpO(:,1);
u5(2,:) = pos_SpU(:,1);
u5(3,:) = pos_drives(:,1);
y5(1,:) = press_z(:,1);
load('Versuch6.mat')

u6(1,:) = pos_SpO(:,1);
u6(2,:) = pos_SpU(:,1);
u6(3,:) = pos_drives(:,1);
y6(1,:) = press_z(:,1);
load('Versuch7.mat')

u7(1,:) = pos_SpO(:,1);
u7(2,:) = pos_SpU(:,1);
u7(3,:) = pos_drives(:,1);
y7(1,:) = press_z(:,1);
load('Versuch8.mat')

u8(1,:) = pos_SpO(:,1);
u8(2,:) = pos_SpU(:,1);
u8(3,:) = pos_drives(:,1);
y8(1,:) = press_z(:,1);

u = horzcat(u1,u2,u3,u4,u5,u6,u7,u8);
y = horzcat(y1,y2,y3,y4,y5,y6,y7,y8);

trainFcn = 'trainlm';
net = feedforwardnet(20,trainFcn); 
net = configure(net,u,y);

net = train(net,u,y); 
netz_output = net(u); 

error = gsubtract(y,netz_output);
error = error.^2;
error = sum(error);
error = error/length(y);



plot(y,'ro');
hold on;
plot(netz_output,'b.')






 