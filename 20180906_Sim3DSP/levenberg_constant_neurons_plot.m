
untere_grenze = zeros(1,972);
obere_grenze = zeros(1,972);
for i=1:1:972
    
   untere_grenze(1,i) = min(output_list(:,i)); 
   obere_grenze(1,i) = max(output_list(:,i));   
end


figure(1);

subplot(2,1,1);
plot(y,'o');
hold on;
plot(untere_grenze,'-');
hold on;
plot(obere_grenze,'-');
grid on;
xlabel('Zeitschritte [-]');
ylabel('Stößelposition [mm]');
legend('Gemessener Verlauf','unterer simulierter Verlauf','oberer simulierter Verlauf');


subplot(2,1,2);
plot(error_list,'o');
xlabel('n-ter Simulationsdurchlauf [-]');
ylabel('MSE');
grid on;

