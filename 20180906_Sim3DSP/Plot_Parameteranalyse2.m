mean_container = cell(10,1);
sem_container = cell(10,1);
length = size(error_container{1,1}(1,:),2);
for j = 1:1:10
    for i=1:1:12
        
        mean_container{j,1}(i,:) = mean(error_container{j,1}(i,:));
        sem_container{j,1}(i,:) = std(error_container{j,1}(i,:))/sqrt(length);
    end

end
figure(1)
hold on;
func_list = ["trainlm","trainbr","trainbfg","trainrp","trainscg","traincgb","traincgf","traincgp","trainoss","traingdx","traingdm","traingd"];
bar(mean_container{10,1});
errorbar(mean_container{10,1},sem_container{10,1},'.')
Labels = {'trainlm', 'trainbr', 'trainbfg', 'trainrp','trainscg','traincgb','traincgf','trainoss','trainoss','traingdx','traingdm','traingd'};
set(gca, 'XTick', 1:12, 'XTickLabel', Labels);
grid on;