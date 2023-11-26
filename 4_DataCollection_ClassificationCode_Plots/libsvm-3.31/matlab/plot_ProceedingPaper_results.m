close all
clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Scotch Yoke Accuracy Plots                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

selected_workspaceFolder = '_ScotchYoke'; %All plots
selected_highFreq = '4.4'; %for Bar and Accuracy Plots
ws = 5;

scatter_width = 0.25;
point_size = 80;

B = [0 0.4470 0.7410];
O = [0.8500 0.3250 0.0980];
Y = [0.9290 0.6940 0.1250];
P = [0.4940 0.1840 0.5560];

%ORIENTATION
figure(1)
load(['Workspaces',selected_workspaceFolder,'/workspace_reference_low3.1_high',selected_highFreq,'.mat']);
data = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
error = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];
wSize = window_size(ws)/40;
load(['Workspaces',selected_workspaceFolder,'/workspace_sideOrientation_low3.1_high',selected_highFreq,'.mat']);
data(:,:,end+1) = [acc(3,:); acc(2,:); acc(4,:); acc(1,:)];
error(:,:,end+1) = [std_acc(3,:); std_acc(2,:); std_acc(4,:); std_acc(1,:)];

expConditions = 1:2;

F4 = [data(1,ws,1) data(1,ws,2)];
F3 = [data(2,ws,1) data(2,ws,2)];
F2 = [data(3,ws,1) data(3,ws,2)];
R1 = [data(4,ws,1) data(4,ws,2)];

er_F4 = [error(1,ws,1) error(1,ws,2)];
er_F3 = [error(2,ws,1) error(2,ws,2)];
er_F2 = [error(3,ws,1) error(3,ws,2)];
er_R1 = [error(4,ws,1) error(4,ws,2)];

errorbar(expConditions - scatter_width, F4, er_F4, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
hold on;
scatter(expConditions - scatter_width, F4, point_size, B, 'filled');

errorbar(expConditions - scatter_width/2, F3, er_F3, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions - scatter_width/2, F3, point_size, O, 'filled');

errorbar(expConditions + scatter_width/2, F2, er_F2, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width/2, F2, point_size, Y, 'filled');

errorbar(expConditions + scatter_width, R1, er_R1, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width, R1, point_size, P, 'filled');
box off;
hold off;

xlabel('Fabric Orientations','FontSize',18,'Color','k');
ylim([40 100])
ylabel('Accuracy (%)','FontSize',18,'Color','k');
set(gca, 'XTick', expConditions, 'XTickLabel', {'Perpendicular', 'Parallel'}, 'fontsize',16);

legend({'F4','F3', 'F2', 'R1'}, 'Location','southeast');
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different orientations using scotch yoke'], 'FontSize',16,'Color','k');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%LAYERING
figure(2)
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

expConditions = 1:3;

F4 = [data(1,ws,1) data(1,ws,2) data(1,ws,3)];
F3 = [data(2,ws,1) data(2,ws,2) data(2,ws,3)];
F2 = [data(3,ws,1) data(3,ws,2) data(3,ws,3)];
R1 = [data(4,ws,1) data(4,ws,2) data(4,ws,3)];

er_F4 = [error(1,ws,1) error(1,ws,2) error(1,ws,3)];
er_F3 = [error(2,ws,1) error(2,ws,2) error(2,ws,3)];
er_F2 = [error(3,ws,1) error(3,ws,2) error(3,ws,3)];
er_R1 = [error(4,ws,1) error(4,ws,2) error(4,ws,3)];

errorbar(expConditions - scatter_width, F4, er_F4, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
hold on;
scatter(expConditions - scatter_width, F4, point_size, B, 'filled');

errorbar(expConditions - scatter_width/2, F3, er_F3, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions - scatter_width/2, F3, point_size, O, 'filled');

errorbar(expConditions + scatter_width/2, F2, er_F2, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width/2, F2, point_size, Y, 'filled');

errorbar(expConditions + scatter_width, R1, er_R1, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width, R1, point_size, P, 'filled');
box off;
hold off;

xlabel('Fabric Layering','FontSize',18,'Color','k');
ylim([40 100])
ylabel('Accuracy (%)','FontSize',18,'Color','k');
set(gca, 'XTick', expConditions, 'XTickLabel', {'Single', 'Double', 'Triple'}, 'fontsize',16);

legend({'F4','F3', 'F2', 'R1'}, 'Location','southeast');
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different farbric layering using scotch yoke'], 'FontSize',16,'Color','k');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%WIDTH
figure(3)
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

expConditions = 1:3;

F4 = [data(1,ws,1) data(1,ws,2) data(1,ws,3)];
F3 = [data(2,ws,1) data(2,ws,2) data(2,ws,3)];
F2 = [data(3,ws,1) data(3,ws,2) data(3,ws,3)];
R1 = [data(4,ws,1) data(4,ws,2) data(4,ws,3)];

er_F4 = [error(1,ws,1) error(1,ws,2) error(1,ws,3)];
er_F3 = [error(2,ws,1) error(2,ws,2) error(2,ws,3)];
er_F2 = [error(3,ws,1) error(3,ws,2) error(3,ws,3)];
er_R1 = [error(4,ws,1) error(4,ws,2) error(4,ws,3)];

errorbar(expConditions - scatter_width, F4, er_F4, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
hold on;
scatter(expConditions - scatter_width, F4, point_size, B, 'filled');

errorbar(expConditions - scatter_width/2, F3, er_F3, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions - scatter_width/2, F3, point_size, O, 'filled');

errorbar(expConditions + scatter_width/2, F2, er_F2, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width/2, F2, point_size, Y, 'filled');

errorbar(expConditions + scatter_width, R1, er_R1, 'k.', 'LineWidth', 0.5,'HandleVisibility', 'off');
scatter(expConditions + scatter_width, R1, point_size, P, 'filled');
box off;
hold off;

xlabel('Fabric Widths','FontSize',18,'Color','k');
ylim([40 100])
ylabel('Accuracy (%)','FontSize',18,'Color','k');
set(gca, 'XTick', expConditions, 'XTickLabel', {'Small', 'Medium', 'Large'}, 'fontsize',16);

legend({'F4','F3', 'F2', 'R1'}, 'Location','southeast');
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'for different fabric widths using scotch yoke'], 'FontSize',16,'Color','k');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Robot Manipulator Accuracy Plots with Varying Window Sizes (Orientation)        %            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

errobar_plot = true; %affects Accuracy

selected_workspaceFolder = '_RobotArm';
accAxes = [0 2.5 40 105]; %window size up to 100dp (2.5s)c

load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-parallel_low150_high300.mat']);
figure(4)
windowSize = window_size/40;
if errobar_plot == true
    p4 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-' );
    hold on;
    p3 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
    p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
    p1 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
    hold off;
else
    p4 = plot(windowSize, acc(4,:), '.-' );
    hold on;
    p3 = plot(windowSize, acc(3,:), '.-');
    p2 = plot(windowSize, acc(2,:), '.-');
    p1 = plot(windowSize, acc(1,:), '.-');
    hold off;
end
axis(accAxes);
title(['Frequency classification accuracy across different window', newline, 'sizes for parallel oriented fabric using robot manipulator'], 'FontSize',16,'Color','k');
xlabel('Window Size (s)','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');
box off;


load(['Workspaces',selected_workspaceFolder,'/workspace_FlatSurface-perpendicular_low150_high300.mat']);
figure(5)
windowSize = window_size/40;
if errobar_plot == true
    p4 = errorbar(windowSize, acc(4,:), std_acc(4,:), '.-' );
    hold on;
    p3 = errorbar(windowSize, acc(3,:), std_acc(3,:), '.-');
    p2 = errorbar(windowSize, acc(2,:), std_acc(2,:), '.-');
    p1 = errorbar(windowSize, acc(1,:), std_acc(1,:), '.-');
    hold off;
else
    p4 = plot(windowSize, acc(4,:), '.-' );
    hold on;
    p3 = plot(windowSize, acc(3,:), '.-');
    p2 = plot(windowSize, acc(2,:), '.-');
    p1 = plot(windowSize, acc(1,:), '.-');
    hold off;
end
axis(accAxes);
title(['Frequency classification accuracy across different window', newline, 'sizes for perpendicular oriented fabric using robot manipulator'], 'FontSize',16,'Color','k');
xlabel('Window Size (s)','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend([p4 p3 p2 p1], {'F4','F3', 'F2', 'R1'}, 'Location','southeast');

box off;






