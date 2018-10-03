%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439

function newLat = applyDiffusionExtended(diffusionRate, latExt)
% APPLYEXTENDED - Function to apply 
% diffusion(diffusionRate, site, N, NE, E, SE, S, SW, W, NW)
% site of matrix latExt and to return the resulting matrix
m = size(latExt, 1) - 2;
n = size(latExt, 2) - 2;
newLat = zeros(m, n);    
% calculate one column at a time because MATLAB is column-oriented
for j = 2:(n + 1)
    for i = 2:(m + 1)
        site = latExt(i, j);
        N = latExt(i - 1, j);
        NE = latExt(i - 1, j + 1);
        E = latExt(i, j + 1);
        SE = latExt(i + 1, j + 1);
        S = latExt(i + 1, j);
        SW = latExt(i + 1, j - 1);
        W = latExt(i, j - 1);
        NW = latExt(i - 1, j - 1);
         [status,x_i,y_j] = weightedDiffusion(site, N, NE, E, SE, S, SW, W, NW, i-1, j-1);
       
         if status ~= -1
             newLat(i - 1, j - 1)=status;
         end
        if x_i~=-1 && y_j ~=-1
            newLat(x_i, y_j)=site;
       end
    end;
end;
