%{
trainlm     Levenberg-Marquardt
trainbr     Bayesian Regularization
trainbfg    BFGS Quasi-Newton
trainrp     Resilient Backpropagation
trainscg    Scaled Conjugate Gradient
traincgb    Conjugate Gradient with Powell/Beale Restarts
traincgf    Fletcher-Powell Conjugate Gradient
traincgp    Polak-Ribiére Conjugate Gradient
trainoss    One Step Secant
traingdx    Variable Learning Rate Gradient Descent
traingdm    Gradient Descent with Momentum
traingd     Gradient Descent
%}


func_list = ["trainlm","trainbr","trainbfg","trainrp","trainscg","traincgb","traincgf","traincgp","trainoss","traingdx","traingdm","traingd"];
error_list = zeros(12,10);
error_container = cell(10,1);
output_list = cell(12,10);

%Importieren und Vorbereiten der Daten

load('u1.mat');
load('y1.mat');

u = u';
y = y';


for k=1:1:10

    for j = 1:1:12

        for i=1:1:10


            %Bestimmen der Netzparamter


            trainFcn = char(func_list(1,j));
            net = feedforwardnet(k,trainFcn); 
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
            error_list(j,i) = error;
           
            output_list{j,i} = netz_output;

        end
    end
    
     error_container{k,1} = error_list;
end











