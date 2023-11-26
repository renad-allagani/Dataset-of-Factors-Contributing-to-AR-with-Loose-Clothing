close all 
clear
clc

accPlots = true;
motionPlots = false;

selected_workspaceFolder = '_RobotArm_Plane'; %All plots
errobar_plot = true; %affects Accuracy

selected_trial_str = '16'; %Motion plots only
zscore_plot = true; %Motion plots only

accAxes = [0 100 60 105]; %window size up to 100

motionAxes = [];
zMotionAxes = [0 230 -2 2.2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy & Window Size                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if accPlots == true

    figure(1)
    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq150']);
    subplot(2,2,1)
    if errobar_plot == true
        p4 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-' );
        hold on;
        p3 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p1 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p4 = plot(window_size, acc(4,:), '.-' );
        hold on;
        p3 = plot(window_size, acc(3,:), '.-');
        p2 = plot(window_size, acc(2,:), '.-');
        p1 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Plane Classification (flat vs. incline)',newline 'of Parallel-oriented Fabric at Frequency (150 mm/s) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (%)','FontSize',12,'FontWeight','bold','Color','b');
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');

    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq300']);
    subplot(2,2,2)
    if errobar_plot == true
        p4 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-' );
        hold on;
        p3 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p1 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p4 = plot(window_size, acc(4,:), '.-' );
        hold on;
        p3 = plot(window_size, acc(3,:), '.-');
        p2 = plot(window_size, acc(2,:), '.-');
        p1 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Plane Classification (flat vs. incline)',newline 'of Parallel-oriented Fabric at Frequency (300 mm/s) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (%)','FontSize',12,'FontWeight','bold','Color','b');
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');


    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq150']);
    subplot(2,2,3)
    if errobar_plot == true
        p4 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-' );
        hold on;
        p3 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p1 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p4 = plot(window_size, acc(4,:), '.-' );
        hold on;
        p3 = plot(window_size, acc(3,:), '.-');
        p2 = plot(window_size, acc(2,:), '.-');
        p1 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Plane Classification (flat vs. incline)',newline 'of Perpendicular-oriented Fabric at Frequency (150 mm/s) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (%)','FontSize',12,'FontWeight','bold','Color','b');
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');

    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq300']);
    subplot(2,2,4)
    if errobar_plot == true
        p4 = errorbar(window_size, acc(4,:), std_acc(4,:), '.-' );
        hold on;
        p3 = errorbar(window_size, acc(3,:), std_acc(3,:), '.-');
        p2 = errorbar(window_size, acc(2,:), std_acc(2,:), '.-');
        p1 = errorbar(window_size, acc(1,:), std_acc(1,:), '.-');
        hold off;
    else
        % plot(window_size, acc, '.-');
        p4 = plot(window_size, acc(4,:), '.-' );
        hold on;
        p3 = plot(window_size, acc(3,:), '.-');
        p2 = plot(window_size, acc(2,:), '.-');
        p1 = plot(window_size, acc(1,:), '.-');
        hold off;
    end
    axis(accAxes);
    title(['Plane Classification (flat vs. incline)',newline 'of Perpendicular-oriented Fabric at Frequency (300 mm/s) '], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Window Size (no. of datapoints)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Classification Accuracy (%)','FontSize',12,'FontWeight','bold','Color','b');
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Motion                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if motionPlots == true

    selected_trial = str2double(selected_trial_str);

    if zscore_plot == true
        title_str = 'Standardized';
    else
        title_str = ['Trial #', selected_trial_str];
    end

    figure(2)
    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq150']);
    subplot(2,2,1)
    if zscore_plot == true
        lowZ = zscore(low,0,'all');
        p4 = plot(lowZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(lowZ(:,selected_trial,3), '.-');
        p2 = plot(lowZ(:,selected_trial,2), '.-');
        p1 = plot(lowZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(low(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(low(:,selected_trial,3), '.-');
        p2 = plot(low(:,selected_trial,2), '.-');
        p1 = plot(low(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title(['Horizontal Motion (150 mm/s)',newline 'of Parallel-oriented Fabric at Flat Surface'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq150']);
    subplot(2,2,2)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p4 = plot(highZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(highZ(:,selected_trial,3), '.-');
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p1 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(high(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(high(:,selected_trial,3), '.-');
        p2 = plot(high(:,selected_trial,2), '.-');
        p1 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title(['Horizontal Motion (150 mm/s)',newline 'of Parallel-oriented Fabric at Incline Surface'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');

    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq300']);
    subplot(2,2,3)
    if zscore_plot == true
        lowZ = zscore(low,0,'all');
        p4 = plot(lowZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(lowZ(:,selected_trial,3), '.-');
        p2 = plot(lowZ(:,selected_trial,2), '.-');
        p1 = plot(lowZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(low(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(low(:,selected_trial,3), '.-');
        p2 = plot(low(:,selected_trial,2), '.-');
        p1 = plot(low(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title(['Horizontal Motion (300 mm/s)',newline 'of Parallel-oriented Fabric at Flat Surface'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    load(['Workspaces',selected_workspaceFolder,'/workspace_parallel_freq300']);
    subplot(2,2,4)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p4 = plot(highZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(highZ(:,selected_trial,3), '.-');
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p1 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(high(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(high(:,selected_trial,3), '.-');
        p2 = plot(high(:,selected_trial,2), '.-');
        p1 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title(['Horizontal Motion (300 mm/s)',newline 'of Parallel-oriented Fabric at Incline Surface'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');


    figure(3)
    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq150']);
    subplot(2,2,1)
    if zscore_plot == true
        lowZ = zscore(low,0,'all');
        p4 = plot(lowZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(lowZ(:,selected_trial,3), '.-');
        p2 = plot(lowZ(:,selected_trial,2), '.-');
        p1 = plot(lowZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(low(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(low(:,selected_trial,3), '.-');
        p2 = plot(low(:,selected_trial,2), '.-');
        p1 = plot(low(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str,' Horizontal Motion (150 mm/s)',newline 'of Perpendicular-oriented Fabric in Flat Plane'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');

    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq150']);
    subplot(2,2,2)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p4 = plot(highZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(highZ(:,selected_trial,3), '.-');
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p1 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(high(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(high(:,selected_trial,3), '.-');
        p2 = plot(high(:,selected_trial,2), '.-');
        p1 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str,' Horizontal Motion (150 mm/s)',newline 'of Perpendicular-oriented Fabric in Incline Plane'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');

    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq300']);
    subplot(2,2,3)
    if zscore_plot == true
        lowZ = zscore(low,0,'all');
        p4 = plot(lowZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(lowZ(:,selected_trial,3), '.-');
        p2 = plot(lowZ(:,selected_trial,2), '.-');
        p1 = plot(lowZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(low(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(low(:,selected_trial,3), '.-');
        p2 = plot(low(:,selected_trial,2), '.-');
        p1 = plot(low(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str,' Horizontal Motion (300 mm/s)',newline 'of Perpendicular-oriented Fabric in Flat Plane'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');

    load(['Workspaces',selected_workspaceFolder,'/workspace_perpendicular_freq300']);
    subplot(2,2,4)
    if zscore_plot == true
        highZ = zscore(high,0,'all');
        p4 = plot(highZ(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(highZ(:,selected_trial,3), '.-');
        p2 = plot(highZ(:,selected_trial,2), '.-');
        p1 = plot(highZ(:,selected_trial,1), '.-');
        hold off;
        axis(zMotionAxes);
    else
        p4 = plot(high(:,selected_trial,4), '.-' );
        hold on;
        p3 = plot(high(:,selected_trial,3), '.-');
        p2 = plot(high(:,selected_trial,2), '.-');
        p1 = plot(high(:,selected_trial,1), '.-');
        hold off;
        axis(motionAxes);
    end
    legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
    title([title_str,' Horizontal Motion (300 mm/s)',newline 'of Perpendicular-oriented Fabric in Incline Plane'], 'FontSize',16,'FontWeight','bold','Color','r');
    xlabel('Time (1/40 s)','FontSize',12,'FontWeight','bold','Color','b');
    ylabel('Distance (mm)','FontSize',12,'FontWeight','bold','Color','b');
end




