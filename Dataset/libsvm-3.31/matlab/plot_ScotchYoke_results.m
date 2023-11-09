close all
clear
clc

selected_workspaceFolder = '_ScotchYoke'; %All plots
selected_highFreq = '4.4'; %for Bar and Accuracy Plots
ws = 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Accuracy Bar Plots                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ORIENTATION
figure(1)
%     subplot(1,3,1);
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

gpAll = [gp1; gp2];
erAll = [er1; er2];
xLabels = ["Perpendicular", "Parallel"];

bar(gpAll)
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
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'using scotch yoke for different orientations'], 'FontSize',16,'Color','k');
xlabel('Fabric Orientation','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend({'F4','F3', 'F2', 'R1'}, 'Location','northeast');
box off;
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%LAYERING
figure(2)
%     subplot(1,3,2);
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

gpAll = [gp1; gp2; gp3];
erAll = [er1; er2; er3];
xLabels = ["Single", "Double", "Triple"];

bar(gpAll)
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
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'using scotch yoke for different layering'], 'FontSize',16,'Color','k');
xlabel('Fabric Layering','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend({'F4','F3', 'F2', 'R1'}, 'Location','northwest');
box off;
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%WIDTH
figure(3)
%     subplot(1,3,3);
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

gpAll = [gp1; gp2; gp3];
erAll = [er1; er2; er3];
xLabels = ["Small", "Medium", "Large"];

bar(gpAll)
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
title(['Frequency classification accuracy at ',num2str(wSize),'s window',newline, 'using scotch yoke for different widths'], 'FontSize',16,'Color','k');
xlabel('Fabric Width','FontSize',18,'Color','k');
ylabel('Accuracy (%)','FontSize',18,'Color','k');
legend({'F4','F3', 'F2', 'R1'}, 'Location','northeast');
box off;
hold off


