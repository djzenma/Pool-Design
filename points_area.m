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

points = sortrows(points);

i = 1;

sum = 0;
while i < size(in,1)
    level = 1;
    while 1
        j = i;
        [lvl1,j] = get_lvl(j,in);
        [lvl2,j] = get_lvl(j+1,in);
        if lvl1 ~= lvl2
            break
        else
            level = level + 1;
        end
    end
    while level > 1
        sum = sum + int(get_curve(i,j-i,level,in));
        level = level-2;
    end
    i = i + j;    
end

disp(sum)

function ret = get_curve(n,itt,lvl,in)
    for i = 0:itt
        ret = [ret;in(n+i*lvl)];
    end        
end

function [j,lvl] = get_lvl(i,in)
    j = i;
    while 1
        if in(j,2) ~= in(j+1,2)
            break
        else
            lvl = lvl + 1;
            j = j + 1;
        end
    end
end

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