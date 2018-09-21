figure(1);

subplot(2,1,1)
for i=1:1:12
    
    plot(error_list(i,:),'.-');
    hold on;

end
xlabel('Anzahl der Neuronen');
ylabel('MSE');
legend('Levenberg-Marquardt','Bayesian Regularization','BFGS Quasi-Newton','Resilient Backpropagation','Scaled Conjugate Gradient','Conjugate Gradient with Powell/Beale Restarts','Fletcher-Powell Conjugate Gradient','Polak-Ribiére Conjugate Gradient','One Step Secant','Variable Learning Rate Gradient Descent','Gradient Descent with Momentum','Gradient Descent');
grid on;


subplot(2,1,2)

for i=1:1:10
    
    plot(error_list(i,:),'.-');
    hold on;

end
xlabel('Anzahl der Neuronen');
ylabel('MSE');
legend('Levenberg-Marquardt','Bayesian Regularization','BFGS Quasi-Newton','Resilient Backpropagation','Scaled Conjugate Gradient','Conjugate Gradient with Powell/Beale Restarts','Fletcher-Powell Conjugate Gradient','Polak-Ribiére Conjugate Gradient','One Step Secant','Variable Learning Rate Gradient Descent');
grid on;
