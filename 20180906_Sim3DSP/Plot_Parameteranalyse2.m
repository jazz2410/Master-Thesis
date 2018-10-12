mean_container = cell(10,1);
sem_container = cell(10,1);
length = size(error_container{1,1}(1,:),2);
for j = 1:1:10
    for i=1:1:12
        
        mean_container{j,1}(i,:) = mean(error_container{j,1}(i,:));
        sem_container{j,1}(i,:) = std(error_container{j,1}(i,:));
    end

end
figure(1)

for i=1:1:10
    subplot(10,1,i)
    hold on;
    bar(mean_container{i,1});
    errorbar(mean_container{i,1},sem_container{i,1},'.')
    Labels = {'trainlm', 'trainbr', 'trainbfg', 'trainrp','trainscg','traincgb','traincgf','trainoss','trainoss','traingdx','traingdm','traingd'};
    set(gca, 'XTick', 1:12, 'XTickLabel', Labels);
    xlabel('Trainingsverfahren');
    ylabel('MSE');
    grid on;
    title(strcat(num2str(i),' Neuron(en)'))
end