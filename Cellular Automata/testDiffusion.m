%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439


% testDiffusion.m

global DEATH_EATER FOLLOWER ORDER_OF_PHOENIX STUDENT DEAD
ORDER_OF_PHOENIX = 10;
STUDENT = 20;
DEAD = 30;
FOLLOWER = 40;
DEATH_EATER = 50;

m=30;
n=30;

%Initialize conditions
deathEatersPos = [];
followerPos = [];
orderPos = [];
studentPos = [];
global emptyPos;
emptyPos=[];

for i = 1:m
    for j = 1:n
            u = rand();
         if u < 150/2150
             deathEatersPos = [deathEatersPos; [i, j]];
         elseif u < 350/2150
             orderPos = [orderPos; [i, j]];
        elseif u < 950/2150
            followerPos = [followerPos; [i, j]];
        elseif u < 1550/2150
            studentPos = [studentPos; [i, j]];
        else
           emptyPos = [emptyPos; [i, j]];
         end
    end
end

%====================================

    
t = 25;

grids = diffusionSim(m, n, 0, deathEatersPos, followerPos, orderPos, studentPos, emptyPos, t);

M = animDiffusionColor(grids,t)
title('Hogwarts Battle Ground')
xlabel('t = 25')
