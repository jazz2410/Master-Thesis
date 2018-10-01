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

net = narxnet(1:2,1:2,5,'open','trainbr'); 
[Ys,Yi,Ai,Xs] = preparets(net,y1,{},x1); 
net = train(net,Ys,Xs,Yi,Ai); 
view(net); 
[XOpen,Yf,Af] = net(Ys,Yi,Ai); 
x = cell2mat(XOpen);
x = x';
Xs = cell2mat(Xs);
Xs = Xs';


    