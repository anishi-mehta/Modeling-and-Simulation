%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439

function [grids,i] = diffusionSim(m, n, diffusionRate, deathEatersPos, followerPos, orderPos, studentPos, emptyPos, t)
% DIFFUSIONSIM Diffusion simulation
%Stores all the grids for different time-steps from 1 to t
global DEATH_EATER FOLLOWER ORDER_OF_PHOENIX STUDENT DEAD
ORDER_OF_PHOENIX = 10;
STUDENT = 20;
DEAD = 30;
FOLLOWER = 40;
DEATH_EATER = 50;

%%% Initialize grid
ground = initBar(m, n, deathEatersPos, followerPos, orderPos, studentPos);

%%% Perform simulation
grids = zeros(m, n, t + 1);
grids(:, :, 1) = ground;
for i = 2:(t + 1)
    % Extend matrix at each time-step
    groundExtended = absorbLat(ground);
    % Apply spread of heat function to each grid point
    ground = applyDiffusionExtended(diffusionRate, groundExtended); %Applying diffusion
    % Save new matrix
    grids(:, :, i) = ground;
end;
