%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439

function M = animDiffusionColor(grids, t)
% ANIMDIFFUSIONCOLOR - Function to return color movie visualization 
% of grids in grids
global DEATH_EATER FOLLOWER ORDER_OF_PHOENIX STUDENT DEAD
lengthGrids =t ;
%lengthGrids = size(grids, 3);
disp(lengthGrids);
M = moviein(lengthGrids); % Number of frames of the movie is equal to the number of time-steps

map = zeros(DEATH_EATER + 1, 3);
for i = 0:DEATH_EATER
    amt = i/DEATH_EATER;
    map(i + 1, :) = [amt, 0, 1 - amt];
end; 
colormap(map);

m = size(grids, 1);
n = size(grids, 2);
disp('Size of the grid');
disp(m);
disp(n);

for k = 1:lengthGrids
    g = grids(:, :, k);
    image(g + 1) %understand how the mapping takes place between image and colormap and the role of moviein
    colormap(map);

    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
    pause(5);
end;

