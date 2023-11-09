clc
clear
clc

expName = {'FlatSurface-parallel', 'FlatSurface-perpendicular'};

lowFreq = '150';
highFreq = '300';

for expIndex = 1:length(expName)

    repeats =30;
    startRow=1;
    startColumn=1;
    endRow=400;
    endColumn=53;

    for trial_number = 1 : repeats
        low_data(startRow:endRow,startColumn:endColumn,trial_number) = readmatrix(['DataCollection_RobotArm/', expName{expIndex},'/',lowFreq,'/low',num2str(trial_number),'.csv'], 'Range', [startRow startColumn endRow endColumn]);
        high_data(startRow:endRow,startColumn:endColumn,trial_number) = readmatrix(['DataCollection_RobotArm/', expName{expIndex},'/',highFreq,'/high',num2str(trial_number),'.csv'], 'Range', [startRow startColumn endRow endColumn]);
    end


    %% generate train_num and test_num
    train=[];
    test=[];
    num=1;
    while(num<101)
        A = [1:repeats];
        A_temp = A;
        % test
        while length(test)<floor(repeats/2)
            temp = 1+floor(repeats.*rand(1));
            if ismember(temp,A_temp)
                test = [test, temp];
                A_temp = setdiff(A_temp,temp);
            end
        end

        % train
        train= A_temp;

        % sort()
        test_num(:,num)= sort(test);
        train_num(:,num) = sort(train);
        num=num+1;
        train=[];
        test=[];
    end
    %% parameter setting
    
    if (mod(expIndex,2)==0)
        %even so perpendicular
        s = [11;24;37;50];%Ty
    else
        %odd so parallel
        s = [12;25;38;51];%Tz
    end 


    %% fill the missing data
    for i = 1 : repeats 
        startCol = 2+ceil(148*rand(1)); %startCol & endCol will change only for each trial 
        endCol = startCol + 230; %like saying '2:232'
        for j = 1 : 4 %sensor
            low(:,i,j) = low_data(startCol:endCol,s(j,:),i); %low_data(2:220,s(j,:),i);
            high(:,i,j) = high_data(startCol:endCol,s(j,:),i); %high_data(2:220,s(j,:),i);
        end
    end


    for i = 1 : repeats
        for j = 1 : 4
            index = find(low(:,i,j) == -3.697314000000000e+28);
            low(index,i,j)= NaN;
            low(:,i,j) = fillmissing(low(:,i,j),'spline');
            loss_low(:,i,j)=size(index,1);

            index = find(high(:,i,j) == -3.697314000000000e+28);
            high(index,i,j)= NaN;
            high(:,i,j) = fillmissing(high(:,i,j),'spline');
            loss_high(:,i,j)=size(index,1);
        end
    end

    %% parameter setting
    window_size=[1,10,20,30,40,50,60,70,80, 90, 100]; %80 data points (2 sec)
    %window_size=[1,10,20,30,40,50,60,70,80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200]; %200 data points (5 sec)

    for z = 1 :size(window_size,2) 
        st = [1:210]; %[1:200];
        ed= [window_size(z):210]; %[window_size(z):200];

        %% z-score, train, test
        for j = 1 : 4
            for i = 1 : size(train_num,2)
                for q = 1 : size(ed,2)
                    train_low = low(:,[train_num(:,i)],j);
                    train_high = high(:,[train_num(:,i)],j);
                    test_low= low(:,[test_num(:,i)],j);
                    test_high = high(:,[test_num(:,i)],j);
                    train=[train_low;train_high];
                    test=[test_low;test_high];

                    train1=zscore(train);
                    test1=zscore(test);
                    train_low1=train1(1:size(low,1),:);
                    train_high1=train1(size(low,1)+1:size(train,1),:);
                    test_low1=test1(1:size(high,1),:);
                    test_high1=test1(size(high,1)+1:size(train,1),:);

                    train_low = train_low1(st(1,q):ed(1,q),:);
                    train_high = train_high1(st(1,q):ed(1,q),:);

                    test_low = test_low1(st(1,q):ed(1,q),:);
                    test_high = test_high1(st(1,q):ed(1,q),:);
                    train_low=sparse(train_low);
                    train_high=sparse(train_high);

                    test_low=sparse(test_low);
                    test_high=sparse(test_high);
                    libsvmwrite('train_data',[zeros(repeats/2,1);ones(repeats/2,1)],[train_low';train_high']);
                    libsvmwrite('test_data',[zeros(repeats/2,1);ones(repeats/2,1)],[test_low';test_high']);
                    [train_label, train_data] = libsvmread('train_data');
                    [test_label, test_data] = libsvmread('test_data');

                    w=['Window_size:',num2str(window_size(z)),' Sensor:',num2str(j),' trial:',num2str(i),' epoch:',num2str(q),'/',num2str(size(ed,2))];
                    disp(w)
                    % [~,bestc,bestg] = SVMcgForClass(train_label, train_data);
                    % cmd = ['-q','-c', num2str(bestc), '-g', num2str(bestg)];

                    % model = svmtrain(train_label,train_data, cmd);
                    model = svmtrain(train_label,train_data);
                    [predict_label,accuracy,~] = svmpredict(test_label,test_data,model);
                    classification_accuracy(j,q,i)=accuracy(1,1);

                    %%
                    [M,cOrder] = confusionmat(test_label,predict_label);
                    tp = sum((predict_label== 1) & (test_label == 1));
                    fp = sum((predict_label == 1) & (test_label == 0));
                    fn = sum((predict_label == 0) & (test_label == 1));
                    F1(j,q,i) = (2*tp)/(2*tp+fp+fn);
                end
            end
        end

        %% F1-score
        acc(:,z) = mean(mean(classification_accuracy,2),3);

        std_acc(:,z) = (std(mean(classification_accuracy,2),0,3));


        F(:,z) = mean(mean(F1,2),3);
        std_F(:,z) = (std(mean(F1,2),0,3));

        train_data=[];
        test_data=[];
        q=[];
        classification_accuracy=[];
        F1=[];

    end
    %% ks

    for j = 1 : 4
        for i = 1 : repeats/2
            for z = 1 : num-1
                [~,~,ks(i,j,z)] = kstest2(low(:,test_num(i,z),j),high(:,test_num(i,z),j));
            end
        end
    end

    D = mean(mean(ks,3),1);
    std_D= std(mean(ks,3));

%     fileName = sprintf('workspace_%s_low%s_high%s.mat',expName{expIndex}, lowFreq, highFreq);
%     save(['Workspaces_RobotArm/',fileName]);


end



                                      
