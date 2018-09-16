[x,t] = chemical_dataset; 
net = fitnet(10); 
net = train(net,x,t); 
view(net) 
y = net(x);

net.IW{1,1}
net.b{1}  

wb = getwb(net);