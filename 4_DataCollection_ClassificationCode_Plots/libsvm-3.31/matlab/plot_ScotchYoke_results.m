close all 
clear
clc

% Assign (true) to plots you wish to display
accBarPlots = true;
accPlots = false;
ksPlots = false;

selected_workspaceFolder = '_ScotchYoke'; %All plots
selected_highFreq = '4.4'; %for Bar and Accuracy Plots
ws = 5;

errobar_plot = true; %affects Accuracy & KSTest
accAxes = [0 2.5 40 105]; %for Accuracy Plots, window sizes up to 100dp (2.5s)
ksAxes = [3.5 4.5 0 0.3]; %for KS Plots

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy Bar Plots                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if accBarPlots == true

    %ORIENTATION
    figure(1)
%     subplot(1,3,1);
%     ws = 5; %selected window size
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    data = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
    wSize = window_size(ws)/40;
    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high',selected_highFreq,'.mat']);
    data(:,:,end+1) = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error(:,:,end+1) = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];

    gp1 = [data(1,ws,1) data(2,ws,1) data(3,ws,1) data(4,ws,1)];
    gp2 = [data(1,ws,2) data(2,ws,2) data(3,ws,2) data(4,ws,2)];

    er1 = [error(1,ws,1) error(2,ws,1) error(3,ws,1) error(4,ws,1)];
    er2 = [error(1,ws,2) error(2,ws,2) error(3,ws,2) error(4,ws,2)];

%     gpAll = [gp1-data(4,ws,1); gp2-data(4,ws,2)];
%     erAll = [er1-error(4,ws,1); er2-error(4,ws,2)];
    gpAll = [gp1; gp2];
    erAll = [er1; er2];
    xLabels = ["Perpendicular", "Parallel"];

    bar(gpAll)
%     ylim([0 20])
    ylim([30 100])

    hold on
    [ngroups, nbars] = size(gpAll);     % Find the number of groups and the number of bars in each group
    groupwidth = min(0.8, nbars/(nbars + 1.5));     % Calculate the width for each bar group
    for i = 1:nbars     % Set the position of each error bar in the centre of the main bar
        x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
        errorbar(x, gpAll(:,i), erAll(:,i), 'k', 'linestyle', 'none');
%         text(x,gpAll(:,i),num2str(round(gpAll(:,i),2)),'vert','bottom','horiz','center');
    end
    set(gca,'xticklabel', xLabels, 'FontSize', 16)
%     title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'using scotch yoke for different orientations'], 'FontSize',16,'Color','k');
    xlabel('Fabric Orientation','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
%     legend({'F4','F3', 'F2', 'R1'}, 'Location','northeast');
    box off;
    hold off

%     varArray = [var(gp1), var(gp2)];

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %LAYERING
    figure(2)
%     subplot(1,3,2);
%     ws = 3; %selected window size
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    data = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
    wSize = window_size(ws)/40;
    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high',selected_highFreq,'.mat']);
    data(:,:,end+1) = [acc(2,:); acc(1,:); acc(4,:); acc(3,:)];
    error(:,:,end+1) = [std_acc(2,:); std_acc(1,:); std_acc(4,:); std_acc(3,:)];
    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high',selected_highFreq,'.mat']);
    data(:,:,end+1) = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error(:,:,end+1) = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];

    gp1 = [data(1,ws,1) data(2,ws,1) data(3,ws,1) data(4,ws,1)];
    gp2 = [data(1,ws,2) data(2,ws,2) data(3,ws,2) data(4,ws,2)];
    gp3 = [data(1,ws,3) data(2,ws,3) data(3,ws,3) data(4,ws,3)];

    er1 = [error(1,ws,1) error(2,ws,1) error(3,ws,1) error(4,ws,1)];
    er2 = [error(1,ws,2) error(2,ws,2) error(3,ws,2) error(4,ws,2)];
    er3 = [error(1,ws,3) error(2,ws,3) error(3,ws,3) error(4,ws,3)];

%     gpAll = [gp1-data(4,ws,1); gp2-data(4,ws,2); gp3-data(4,ws,3)];
%     erAll = [er1-error(4,ws,1); er2-error(4,ws,2); er3-error(4,ws,3)];
    gpAll = [gp1; gp2; gp3];
    erAll = [er1; er2; er3];
    xLabels = ["Single", "Double", "Triple"];

    bar(gpAll)
%     ylim([0 20])
    ylim([30 100])

    hold on
    [ngroups, nbars] = size(gpAll);     % Find the number of groups and the number of bars in each group
    groupwidth = min(0.8, nbars/(nbars + 1.5));     % Calculate the width for each bar group
    for i = 1:nbars     % Set the position of each error bar in the centre of the main bar
        x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
        errorbar(x, gpAll(:,i), erAll(:,i), 'k', 'linestyle', 'none');
%         text(x,gpAll(:,i),num2str(round(gpAll(:,i),2)),'vert','bottom','horiz','center');
    end
    set(gca,'xticklabel', xLabels, 'FontSize', 16)
%     title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different layers'], 'FontSize',16,'Color','k');
    xlabel('Fabric Layering','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
%     legend({'F4','F3', 'F2', 'R1'}, 'Location','northwest');
    box off;
    hold off

%     varArray = [var(gp1), var(gp2), var(gp3)];

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %WIDTH
    figure(3)
%     subplot(1,3,3);
%     ws = 3; %selected window size
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    data = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
    wSize = window_size(ws)/40;
    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high',selected_highFreq,'.mat']);
    data(:,:,end+1) = [acc(2,:); acc(1,:); acc(4,:); acc(3,:)];
    error(:,:,end+1) = [std_acc(2,:); std_acc(1,:); std_acc(4,:); std_acc(3,:)];
    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high',selected_highFreq,'.mat']);
    data(:,:,end+1) = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
    error(:,:,end+1) = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];

    gp1 = [data(1,ws,1) data(2,ws,1) data(3,ws,1) data(4,ws,1)];
    gp2 = [data(1,ws,2) data(2,ws,2) data(3,ws,2) data(4,ws,2)];
    gp3 = [data(1,ws,3) data(2,ws,3) data(3,ws,3) data(4,ws,3)];

    er1 = [error(1,ws,1) error(2,ws,1) error(3,ws,1) error(4,ws,1)];
    er2 = [error(1,ws,2) error(2,ws,2) error(3,ws,2) error(4,ws,2)];
    er3 = [error(1,ws,3) error(2,ws,3) error(3,ws,3) error(4,ws,3)];

%     gpAll = [gp1-data(4,ws,1); gp2-data(4,ws,2); gp3-data(4,ws,3)];
%     erAll = [er1-error(4,ws,1); er2-error(4,ws,2); er3-error(4,ws,3)];
    gpAll = [gp1; gp2; gp3];
    erAll = [er1; er2; er3];
    xLabels = ["Small", "Medium", "Large"];

    bar(gpAll)
%     ylim([0 20])
    ylim([30 100])

    hold on
    [ngroups, nbars] = size(gpAll);     % Find the number of groups and the number of bars in each group
    groupwidth = min(0.8, nbars/(nbars + 1.5));     % Calculate the width for each bar group
    for i = 1:nbars     % Set the position of each error bar in the centre of the main bar
        x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
        errorbar(x, gpAll(:,i), erAll(:,i), 'k', 'linestyle', 'none');
%         text(x,gpAll(:,i),num2str(round(gpAll(:,i),2)),'vert','bottom','horiz','center');
    end
    set(gca,'xticklabel', xLabels, 'FontSize', 16)
%     title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different layers'], 'FontSize',16,'Color','k');
    xlabel('Fabric Width','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
%     legend({'F4','F3', 'F2', 'R1'}, 'Location','northeast');
    box off;
    hold off

%     varArray = [var(gp1), var(gp2), var(gp3)];

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     %WIDTH post exclusion of F4
%     figure(3)
%     ws = 5; %selected window size
%     load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
%     data = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
%     error = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
%     wSize = window_size(ws)/40;
%     load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high',selected_highFreq,'.mat']);
%     data(:,:,end+1) = [acc(2,:); acc(1,:); acc(4,:); acc(3,:)];
%     error(:,:,end+1) = [std_acc(2,:); std_acc(1,:); std_acc(4,:); std_acc(3,:)];
%     load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high',selected_highFreq,'.mat']);
%     data(:,:,end+1) = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
%     error(:,:,end+1) = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
% 
%     gp1 = [data(2,ws,1) data(3,ws,1) data(4,ws,1)];
%     gp2 = [data(2,ws,2) data(3,ws,2) data(4,ws,2)];
%     gp3 = [data(2,ws,3) data(3,ws,3) data(4,ws,3)];
% 
%     er1 = [error(2,ws,1) error(3,ws,1) error(4,ws,1)];
%     er2 = [error(2,ws,2) error(3,ws,2) error(4,ws,2)];
%     er3 = [error(2,ws,3) error(3,ws,3) error(4,ws,3)];
% 
%     gpAll_ = [gp1; gp2; gp3];
%     gpAll = [[0;0;0],gpAll_];
%     erAll_ = [er1; er2; er3];
%     erAll = [[0;0;0],erAll_];
%     xLabels = ["Small", "Medium", "Large"];
% 
%     bar(gpAll)
% %     ylim([40 90])
%     ylim([30 100])
% 
%     hold on
%     [ngroups, nbars] = size(gpAll);     % Find the number of groups and the number of bars in each group
%     groupwidth = min(0.8, nbars/(nbars + 1.5));     % Calculate the width for each bar group
%     for i = 1:nbars     % Set the position of each error bar in the centre of the main bar
%         x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
%         errorbar(x, gpAll(:,i), erAll(:,i), 'k', 'linestyle', 'none');
%         text(x,gpAll(:,i),num2str(round(gpAll(:,i),2)),'vert','bottom','horiz','center');
%     end
%     set(gca,'xticklabel', xLabels, 'FontSize', 16)
% %     title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline, 'at Window Size ',num2str(wSize),'s'], 'FontSize',16,'Color','k');
%     title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different widths post exclusion of F4'], 'FontSize',16,'Color','k');
%     xlabel('Fabric Width','FontSize',18,'Color','k');
%     ylabel('Accuracy (%)','FontSize',18,'Color','k');
%     legend({'F4','F3', 'F2', 'R1'}, 'Location','northwest');
%     hold off
% 
% %     varArray = [var(gp1), var(gp2), var(gp3)]

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy & Window Size                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if accPlots == true

    %LAYERING
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    figure(1)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(3,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(2,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Basic" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high',selected_highFreq,'.mat']);
    figure(2)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(2,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(1,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(3,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Double" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');

    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high',selected_highFreq,'.mat']);
    figure(3)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(3,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(2,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Triple" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %ORIENTATION

    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high',selected_highFreq,'.mat']);
    figure(4)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(3,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(2,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Parallel" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %WIDTH

    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high',selected_highFreq,'.mat']);
    figure(5)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(2,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(1,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(3,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Medium" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');

    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high',selected_highFreq,'.mat']);
    figure(6)
    windowSize = window_size/40;
    if errobar_plot == true
        p1 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        p1 = plot(windowSize, acc(3,:), '.-' );
        hold on;
        p2 = plot(windowSize, acc(2,:), '.-');
        p3 = plot(windowSize, acc(4,:), '.-');
        p4 = plot(windowSize, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency classification accuracy across different window', newline, 'sizes using scotch yoke for "Large" fabric placement'], 'FontSize',16,'Color','k');    
    xlabel('Window Size (s)','FontSize',18,'Color','k');
    ylabel('Accuracy (%)','FontSize',18,'Color','k');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                                   KS Test                               %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ksPlots == true

    figure(1)
    D_matrix  = [];
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    %     subplot(2,3,1)
    if errobar_plot == true
        p1 = errorbar(highFreq_matrix, D_matrix(:,3), D_error(:,3), '.-' );
        hold on;
        p2 = errorbar(highFreq_matrix, D_matrix(:,2), D_error(:,2), '.-');
        p3 = errorbar(highFreq_matrix, D_matrix(:,4), D_error(:,4), '.-');
        p4 = errorbar(highFreq_matrix, D_matrix(:,1), D_error(:,1), '.-');
        hold off;
    else
        p1 = plot(highFreq_matrix, D_matrix(:,3), '.-' );
        hold on;
        p2 = plot(highFreq_matrix, D_matrix(:,2), '.-');
        p3 = plot(highFreq_matrix, D_matrix(:,4), '.-');
        p4 = plot(highFreq_matrix, D_matrix(:,1), '.-');
        hold off;
    end
    axis(ksAxes);
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');
    title(['Discrepancy between low and different high frequency data', newline,'at window 0.025s for single layered fabric'], 'FontSize',16,'Color','k');
    xlabel('High Frequency (rad/s)','FontSize',18,'Color','k');
    ylabel('KS Test Statistic D','FontSize',18,'Color','k');


    

    figure(2)
    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    D2 = D_matrix;
    %     subplot(2,3,5)
    if errobar_plot == true
        p1 = errorbar(highFreq_matrix, D_matrix(:,2), D_error(:,2), '.-' );
        hold on;
        p2 = errorbar(highFreq_matrix, D_matrix(:,1), D_error(:,1), '.-');
        p3 = errorbar(highFreq_matrix, D_matrix(:,4), D_error(:,4), '.-');
        p4 = errorbar(highFreq_matrix, D_matrix(:,3), D_error(:,3), '.-');
        hold off;
    else
        p1 = plot(highFreq_matrix, D_matrix(:,2), '.-' );
        hold on;
        p2 = plot(highFreq_matrix, D_matrix(:,1), '.-');
        p3 = plot(highFreq_matrix, D_matrix(:,4), '.-');
        p4 = plot(highFreq_matrix, D_matrix(:,3), '.-');
        hold off;
    end
    axis(ksAxes);
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');
    title(['Discrepancy between low and different high frequency data', newline,'at window 0.025s for double layered fabric'], 'FontSize',16,'Color','k');
    xlabel('High Frequency (rad/s)','FontSize',18,'Color','k');
    ylabel('KS Test Statistic D','FontSize',18,'Color','k');



    figure(3)
    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    D2 = D_matrix;
    %     subplot(2,3,6)
    if errobar_plot == true
        p1 = errorbar(highFreq_matrix, D_matrix(:,3), D_error(:,3), '.-' );
        hold on;
        p2 = errorbar(highFreq_matrix, D_matrix(:,2), D_error(:,2), '.-');
        p3 = errorbar(highFreq_matrix, D_matrix(:,4), D_error(:,4), '.-');
        p4 = errorbar(highFreq_matrix, D_matrix(:,1), D_error(:,1), '.-');
        hold off;
    else
        p1 = plot(highFreq_matrix, D_matrix(:,3), '.-' );
        hold on;
        p2 = plot(highFreq_matrix, D_matrix(:,2), '.-');
        p3 = plot(highFreq_matrix, D_matrix(:,4), '.-');
        p4 = plot(highFreq_matrix, D_matrix(:,1), '.-');
        hold off;
    end
    axis(ksAxes);
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');
    title(['Discrepancy between low and different high frequency data', newline,'at window 0.025s for triple layered fabric'], 'FontSize',16,'Color','k');
    xlabel('High Frequency (rad/s)','FontSize',18,'Color','k');
    ylabel('KS Test Statistic D','FontSize',18,'Color','k');


end

