close all 
clear
clc

accPlots = false;
ksPlots = false;
motionPlots = true;

selected_workspaceFolder = '_ScotchYoke'; %All plots
selected_highFreq = '4.4'; %Accuracy & Motion plots
errobar_plot = true; %affects Accuracy & KSTest

selected_trial_str = '30'; %Motion plots only
zscore_plot = true; %Motion plots only

% AccAxes = [0 200 40 110];
% accAxes = [0 80 40 110]; %window size up to 80
accAxes = [0 100 40 110]; %window size up to 100
ksAxes = [3.5 4.5 0 0.3];

motionAxes = [0 400 -300 100];
zMotionAxes = [0 400 -2 2.5];
% ZMotionAxes = [0 250 -2 2.5]; %for Workspaces2 (200dp processed)
% MotionAxes = [0 250 -300 100]; %for Workspaces2 (200dp processed)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy & Window Size                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if accPlots == true

    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    figure(1)
    subplot(2,3,1)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(3,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(2,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,4)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(3,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(2,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (small, PARALLEL, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,3)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(3,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(2,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (LARGE, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,6)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(3,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(2,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, TRIPLE) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,2)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(2,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(1,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(3,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (MEDIUM, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');


    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,5)
    if errobar_plot == true
        p1 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-' );
        hold on;
        p2 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        p3 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-');
        p4 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p1 = plot(window_size, acc(2,:), '.-' );
        hold on;
        p2 = plot(window_size, acc(1,:), '.-');
        p3 = plot(window_size, acc(4,:), '.-');
        p4 = plot(window_size, acc(3,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Frequency Classification (3.1 vs. ',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, DOUBLE) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (percentage)','FontSize',12,'FontWeight','bold','Color','b');
    % legend({'R1','F3', 'F4', 'F2'},'Location','southeast');
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','northwest');

end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                                   KS Test                               %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ksPlots == true

    figure(2)
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
    subplot(2,3,1)
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
    title({'KSTest of Fabric', '(small, perpendicular, single) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    subplot(2,3,4)
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
    title({'KSTest of Fabric', '(small, PARALLEL, single) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    subplot(2,3,3)
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
    title({'KSTest of Fabric', '(LARGE, perpendicular, single) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');


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
    subplot(2,3,6)
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
    title({'KSTest of Fabric', '(small, perpendicular, TRIPLE) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high3.6.mat']);
    D_matrix = D;
    D_error = std_D;
    highFreq_matrix = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high4.0.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high4.4.mat']);
    D_matrix (end+1,:) = D;
    D_error (end+1,:) = std_D;
    highFreq_matrix (end+1,:) = str2double(highFreq(highFreqIndex));
    D2 = D_matrix;
    subplot(2,3,2)
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
    title({'KSTest of Fabric', '(MEDIUM, perpendicular, single) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');


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
    subplot(2,3,5)
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
    title({'KSTest of Fabric', '(small, perpendicular, DOUBLE) '}, 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('High Frequencies (rad/s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('KSTest Mean Value','FontSize',12,'FontWeight','bold','Color','b');

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Motion                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if motionPlots == true

    selected_trial = str2double(selected_trial_str);

    if zscore_plot == true
        title_str = 'Standardized';
    else
        title_str = ['Trial # ', selected_trial_str];
    end

    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    figure(4)
    if zscore_plot == true
        lowZ = zscore(low,0,'all');
        p1 = plot(lowZ(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(lowZ(:,selected_trial,2), '.-');
        p3 = plot(lowZ(:,selected_trial,4), '.-');
        p4 = plot(lowZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(low(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(low(:,selected_trial,2), '.-');
        p3 = plot(low(:,selected_trial,4), '.-');
        p4 = plot(low(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str,' Horizontal Motion (3.1 rad/s)',newline 'of Fabric (small, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');

    load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
    figure(3)
    subplot(2,3,1)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,2), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str, ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,4)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,2), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str, ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (small, PARALLEL, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_largeWidth_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,3)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,2), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (LARGE, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_threeLayers_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,6)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,3), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,2), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str, ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, TRIPLE) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_mediumWidth_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,2)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,2), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,1), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,3), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,2), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,1), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,3), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str, ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (MEDIUM, perpendicular, single) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_twoLayers_low3.1_high',selected_highFreq,'.mat']);
    subplot(2,3,5)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p1 = plot(highZ(:,selected_trial,2), '.-' );
        hold on;
        p2 = plot(highZ(:,selected_trial,1), '.-');
        p3 = plot(highZ(:,selected_trial,4), '.-');
        p4 = plot(highZ(:,selected_trial,3), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p1 = plot(high(:,selected_trial,2), '.-' );
        hold on;
        p2 = plot(high(:,selected_trial,1), '.-');
        p3 = plot(high(:,selected_trial,4), '.-');
        p4 = plot(high(:,selected_trial,3), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p1 p2 p3 p4], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str, ' Horizontal Motion (',selected_highFreq,' rad/s)',newline 'of Fabric (small, perpendicular, DOUBLE) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


%     data = highZ(:,selected_trial,1);
%     pts= 1:size(data,1);
%     [~, peakIndices] = findpeaks(data,pts,'MinPeakHeight',0);
%     period = max(diff(peakIndices))

end




