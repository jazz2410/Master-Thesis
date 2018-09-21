figure(1);
subplot(3,1,1);
plot3(u(3,:), u(2,:), y,'o');
hold on;
plot3(u(3,:), u(2,:), netz_output,'-');
xlabel('Exzenterwinkel [Grad]');
ylabel('Spindelposition unten [mm]');
zlabel('Stößelposition [mm]');
grid on;
legend('Gemessener Verlauf','letztes Netz');
hold on;

subplot(3,1,2);
plot(y,'o');
hold  on;

plot(output_list(1,:));
hold on;
plot(output_list(5,:));
hold on;
plot(output_list(10,:));
hold on;
plot(output_list(20,:));
hold on;

legend('Gemessener Verlauf','1 Neuron','5 Neuronen','10 Neuronen','20 Neuronen');



xlabel('Zeitschritte [-]');
ylabel('Stößelposition [mm]');
grid on;

subplot(3,1,3);
plot(error_list);
hold on;
xlabel('Anzahl der Neuronen');
ylabel('MSE');
grid on;