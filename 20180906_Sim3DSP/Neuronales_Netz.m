%{
trainlm     Levenberg-Marquardt
trainbr     Bayesian Regularization
trainbfg    BFGS Quasi-Newton
trainrp     Resilient Backpropagation
trainscg    Scaled Conjugate Gradient
traincgb    Conjugate Gradient with Powell/Beale Restarts
traincgf    Fletcher-Powell Conjugate Gradient
traincgp    Polak-Ribi�re Conjugate Gradient
trainoss    One Step Secant
traingdx    Variable Learning Rate Gradient Descent
traingdm    Gradient Descent with Momentum
traingd     Gradient Descent
%}



error_list = [];
output_list = [];
%Importieren und Vorbereiten der Daten

load('u1.mat');
load('y1.mat');

u = u';
y = y';

for i=1:1:10
    

    %Bestimmen der Netzparamter


    trainFcn = 'trainlm';
    net = feedforwardnet(i,trainFcn); 
    net = configure(net,u,y);

    %Setup Division of Data for Training, Validation, Testing
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;


    disp("Input Weights before training")
    net.IW{1,1}
    disp("Layer Weights before training")
    net.LW{2,1}
    disp("Input Bias before training")
    net.b{1}
    disp("Layer Bias after training")
    net.b{2}

    net = train(net,u,y); 
    %view(net); 
    netz_output = net(u);

    disp("Input Weights after training")
    net.IW{1,1}
    disp("Layer Weights after training")
    net.LW{2,1}
    disp("Input bias after training")
    net.b{1}
    disp("Layer bias after training")
    net.b{2}

    wb = getwb(net);
    net.performFcn

    perf = perform(net,y,netz_output);

    error = gsubtract(y,netz_output);
    error = error.^2;
    error = sum(error);
    error = error/length(y);
    error_list(1,i) = error;
    output_list(i,:) = netz_output;
    
end

disp(error_list);

figure(1);
subplot(3,1,1);
plot3(u(3,:), u(2,:), y, 'r.');
hold on;
plot3(u(3,:), u(2,:), netz_output, 'bo');
xlabel('Exzenterwinkel [Grad]');
ylabel('Spindelposition unten [mm]');
zlabel('St��elposition [mm]');
grid on;
hold on;

subplot(3,1,2);
plot(y,'ro');
hold  on;

for i=1:2:10
    
    plot(output_list(i,:),'color',rand(1,3));
    hold on;

end


xlabel('Zeitschritte [-]');
ylabel('St��elposition [mm]');
grid on;

subplot(3,1,3);
plot(error_list);
hold on;
xlabel('Anzahl der Neuronen');
ylabel('MSE');
grid on;











