%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Smriti Sharma:201401003
%Shilpi Chaudhuri:201401025
%Aalisha Dalal:201401433
%Anishi Mehta: 201401439


function [status,x_i,y_j] = weightedDiffusion(site, N, NE, E, SE, S, SW, W, NW, I, J)
% DIFFUSION new value at cell due to diffusion
x_i=-1;
y_j=-1;
% ORDER_OF_PHOENIX = 10.0;
% STUDENT = 20.0;
% DEAD = 30.0;
% FOLLOWER = 40.0;
% DEATH_EATER = 50.0;
global emptyPos;
count = zeros(1, 5);
p_stud = 0.5;
p_foll = 0.2;
p = 0.7;
status = site;
neighbors = [N, NE, E, SE, S, SW, W, NW];

for i = 1:length(neighbors)
% Count number of each type of neighbor
    if neighbors(i) == 10
        count(1) = count(1) + 1;
    elseif neighbors(i) == 20
        count(2) = count(2) + 1;
    elseif neighbors(i) == 30
        count(3) = count(3) + 1;
    elseif neighbors(i) == 40
        count(4) = count(4) + 1;
    else
        count(5) = count(5) + 1;
    end
end
%disp(neighbors)
arr=[count(1:2),count(4:5)];

%disp(sum(arr))
if (site==10 && (count(5)~=0 || count(4)~=0))|| (site==50 && (count(1) ~= 0 || count(2) ~= 0)) || site == 20 || site == 40 || site == 30
    % Apparate if no neighbors
    %disp(count)
    u=rand();
    if site == 10 && (count(5) ~=0 || count(4) ~= 0)
% Site is Order of Phoenix
% If more or equal number of Orders in neighbors than Death Eaters: LIVE
% Else: DIE
        if count(1) >= count(5)
            status = 10;
        elseif u < p
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end

    elseif site == 20
% Site is Student
% If more Orders in neighbors than Death Eaters: LIVE
% If less Orders in neighbors than Death Eaters: DIE
% If equal in number, look at students and followers
% If more students than followers: LIVE
% If less students than followers: DIE
% If equal in number, with probability p_stud: LIVE

        if count(1) > count(5)
            status = 20;
        elseif count(5) > count(1) && u < p
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        else
            if count(2) > count(4) 
                status = 20;
            elseif count(4) > count(2) && u < p
                status = 30;
                emptyPos=[emptyPos;[I,J]];
            else
                u1 = rand();
                if u1 < p_stud
                    status = 20;
                elseif u < p
                    status = 30;
                    emptyPos=[emptyPos;[I,J]];
                end
            end
        end

    elseif site == 40
% Site is Follower
% If Orders present: DIE
% If no Orders present, look at students and followers
% If more followers than students: LIVE
% If less followers than students: DIE
% If equal in number, with probability p_foll: LIVE

        if count(1) ~= 0 && u < p
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        else
            if count(4) > count(2)
                status = 40;
            elseif count(2) > count(4) && u < p
                status = 30;
                emptyPos=[emptyPos;[I,J]];
            else
                u1 = rand();
                if u1 < p_foll
                    status = 40;
                elseif u < p
                    status = 30;
                    emptyPos=[emptyPos;[I,J]];
                end
            end
        end

    elseif site == 50 && (count(1) ~=0 || count(2) ~= 0)
% Site is Death Eater
% If Orders present: DIE
% Else: LIVE
        if count(1) ~= 0 && u < p
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end


    else
% Site is Dead
% Remain Dead
% Do not update if updated before while apparating
        num_pos=size(emptyPos,1);
        if ~ismember([I, J], emptyPos, 'rows')
                status=-1;
        end
    end
    
else
% If no more enemies, Order and Death Eaters will Apparate to random location
    if (site==10 && count(5)==0 && count(4)==0)|| (site==50 && count(1) == 0 && count(2) == 0)
        l_size = size(emptyPos,1);
        x1 = rand;
        pos = floor((l_size-1)*x1 +1);
        x_i = emptyPos(pos,1);
        y_j = emptyPos(pos,2);
        emptyPos(pos, 1) = I;
        emptyPos(pos, 2) = J;
        status=30;
   end
end


