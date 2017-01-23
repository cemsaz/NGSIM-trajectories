clear all;
close all;

load('trajectory_data.mat');

% The leader-follower pair we want to visualize
pair = 1;

% Lane can be chosen from 1 to 7.
lane = 2;

% Set a minimum number data points. We don't want too short trajectories. 
minTrajectoryLenght = 150;

% Call trajectory pair function.
dataTable = getTrajectoryPairs(trajectory_data, lane, minTrajectoryLenght);

% Print the trajectory for the first pair
plotTable = dataTable(find(dataTable(:,1)==pair),:);

figure,
% Plot leader vehicle trajectory 
plot(plotTable(:,4), plotTable(:,2),'bo');
hold on
%Plot following vehicle
plot(plotTable(:,4), plotTable(:,3),'ro');
legend('Leader vehicle','Follower vehicle')
title(sprintf('NGSIM I-80 Trajectory for Pair # %d on Lane %d', pair, lane));
xlabel('Frame number')
ylabel('Vertical position (m)')
