load('u1.mat');
load('y1.mat');

u = u';
y = y';
 
net = fitnet(10); 
net = train(net,u,y); 
view(net); 
netz_output = net(u);


figure(1);
plot3(u(3,:), u(2,:), y, 'r.');
hold;
plot3(u(3,:), u(2,:), netz_output, 'bo');
grid on;

net.IW{1,1}
net.b{1}            

wb = getwb(net);
