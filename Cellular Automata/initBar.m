function ground = initBar(m, n, deathEatersPos, followerPos, orderPos, studentPos)
% INITBAR return m-by-n bar initialized with all ambient temperatures
% except for hot and cold sites
global DEAD
ground = DEAD * ones(m, n);
ground = applyHotCold(ground, deathEatersPos, followerPos, orderPos, studentPos);
