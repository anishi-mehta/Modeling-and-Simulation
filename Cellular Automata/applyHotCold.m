%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439

function ground = applyHotCold(ground, deathEatersPos, followerPos, orderPos, studentPos)
% APPLYHOTCOLD return bar with hot and cold sites
global DEATH_EATER FOLLOWER ORDER_OF_PHOENIX STUDENT
%Particular indices of the grid are set to the necessary temperature HOT OR
%COLD

for k = 1:size(deathEatersPos, 1)
    ground(deathEatersPos(k, 1), deathEatersPos(k, 2)) = DEATH_EATER;
end;

for k = 1:size(followerPos, 1)
    ground(followerPos(k, 1), followerPos(k, 2)) = FOLLOWER;
end;

for k = 1:size(orderPos, 1)
    ground(orderPos(k, 1), orderPos(k, 2)) = ORDER_OF_PHOENIX;
end;

for k = 1:size(studentPos, 1)
    ground(studentPos(k, 1), studentPos(k, 2)) = STUDENT;
end;
