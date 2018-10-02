load('u1.mat');
load('y1.mat');

u = u';
y = y';
[pks,locs] = findpeaks(y);


plot(y,'ro')
hold on;
plot(locs,pks,'b.')

y1 = y;
u1 = u;

for i=1:1:26
   y1(2,a(i,1):b(i,1)) = i*10; 
   y1(2,(b(i,1)+1):a(i+1,1)-1) = (i+1)*10;
end

y1(2,954:972) = 280;
y1(2,1:18) = 1;