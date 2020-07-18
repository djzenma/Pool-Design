clc
clear

z_min = main(in(:,3));
x_min = min(in(:,1));
y_min = min(in(:,2));

% Shift graph so that its in the first quadrant
in(:,1) = in(:,1) - x_min;
in(:,2) = in(:,2) - y_min;

z = in(:,3);
z = sortrow(z);

for i = 1: size(z,1)
    cur_z = z(i);
    con = [];
    for j = 1: size(in,1)
        if cuz_z == in(j,3)
            con = [con,in(j)];
        end
    end
    ret = [ret,get_perimeter(con)];
end

ret = int(ret);

disp(ret);


function ret = get_perimeter(in)
    in = sortrows(in);
    cur = in(start,1);
    ret = 0;
    i = 1;
    while ~empty(in)
        [val,idx] = min(abs(in(:,1)-cur));
        idx = min(abs(idx-i));
        ret = ret + dist(cur,val);
        cur = val(1);
        in(idx) = [];
        i = idx;
    end
end

function ret = dist(in1,in2)
    ret = sqrt( abs(in1(1)-in2(1))^2 + abs(in1(2)-in2(2))^2 );
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