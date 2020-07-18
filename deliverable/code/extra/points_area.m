clc
clear


in = [0,2,0;0.05,1.8555,1;0.15,15970,2;0.25,1.3746,1;0.35,1.1831,0.5;0.475,0.9808,3;0.6,0.8131,0];

z_min = main(in(:,3));
x_min = min(in(:,1));
y_min = min(in(:,2));

% Shift graph so that its in the first quadrant
in(:,1) = in(:,1) - x_min;
in(:,2) = in(:,2) - y_min;

% get points needed to consider (the edges off the object where they all share the minimum Z)
for i = 1:size(in,1)
    if in(i,3) == z_min
        points = [points;in(i)];
    end
end

% sort it so we can go through it linearly from left to right and find where all the y values overlap
points = sortrows(points);

i = 1; % used to itterate over the points to consider

sum = 0; % total area

% every itteration of this while loop takes into consideration a different section of x that have a common number of levels. In other words, all the values of x the represent the same number of different Ys
while i < size(in,1)
    level = 1; % the existence of an x here means i has a level. (naturally)
    while 1
        j = i; % start the temporary itterator j at i
        [lvl1,j] = get_lvl(j,in); % get the number of levels at j and then set j to the end of the levels section
        [lvl2,j] = get_lvl(j+1,in); % get the number of levels in the next section
        if lvl1 ~= lvl2 % check if the levels are the same so we can consider them to be the same section
            break
        else
            level = level + 1;
            j = j + 1;
        end
    end
    if level ~= 1 % if the number of levels is not 1. if it is then it means the point we are at is not part of loop so break.
        while level > 1 & while there are more than 1 levels to considers
            sum = sum + int(get_curve(i,j-i,level,in)) - int(get_curve(i,j-i,level-1,in)); % for this level in this section, get a the points for it curvem integrate it and subtract the integration of the below curve
            level = level-2; % go to the next level
        end
    end
    i = i + j; % set itterator to end of section so we can start considering the next section 
end

disp(sum)

% get the points to represent the curve for a certain level so we can use it for integration
function ret = get_curve(n,itt,lvl,in)
    for i = 0:itt
        ret = [ret;in(n+i*lvl)];
    end        
end

% get number of levels for a given value x. In other words, get the number of y values that exist for a single x value
function [j,lvl] = get_lvl(i,in)
    j = i; % j is the actual index of the level
    while 1
        if in(j,1) ~= in(j+1,1)
            break
        else
            lvl = lvl + 1;
            j = j + 1;
        end
    end
end

% integration, it calculates the most efficient integration, picking from between trapezoidal, and the 2 simpsons formule
function sum = int(in) 
    sum = 0;
    dx = diff(in(:,1));
    i = 2;
    while i < length(x)
        n = 0;
        temp = i-1;
        h = 0;
        while 1
            n = n + 1;
            h = h + dx(temp);
            if ~(temp < length(dx) && abs(dx(temp)-dx(temp+1)) < 1e-2 && n < 3)
                break;
            end
            temp = temp + 1;
        end
        h = h/n;
        if n==1
            sum = sum + (in(i,1)-in(i-1,1))/2 * (in(i-1,2)+in(i,2));
        elseif n == 2
            sum = sum + (h/3)* (in(i-1,2)+4*in(i,2)+in(i+1,2));
        else
            sum = sum + (3*h/8) * (in(i-1,2)+3*in(i,2)+3*in(i+1,2)+in(i+2,2));
        end
        i = i + n;            
    end
end
