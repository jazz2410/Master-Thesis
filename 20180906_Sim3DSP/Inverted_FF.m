load('u1.mat');
load('y1.mat');

x1 = cell(1,972);
y1 = cell(1,972);


for i = 1:1:972
    for j = 1:1:3
        x1{1,i}(j,1) = u(i,j);   
    end
end


for i = 1:1:972
    y1{1,i} = y(i,1);  
end


trainFcn = 'trainlm';
net = layrecnet(1:2,10);
[Ys,Yi,Ai,Xs] = preparets(net,y1,x1);
view(net)
net = train(net,Ys,Yi,Ai); 
netz_output = net(Ys,Yi,Ai);


