function ret = sa_pts(in)
    % Shift graph so that its in the first quadrant
     in(:,1) = in(:,1) - min(in(:,1));
     in(:,2) = in(:,2) - min(in(:,2));
     in(:,3) = in(:,3) - min(in(:,3));

    x = in(:,1);
    x = unique(x);
    ret = [];
    
    for i = 1: size(x,1)
        cur_x = x(i);
        con = [];
        for j = 1: size(in,1)
            if cur_x == in(j,1)
                con = [con;[in(j,:)]];
            end
        end
        ret = [ret;[cur_x,get_perimeter(con)]];
    end

    ret = integ(ret);
end

function ret = get_perimeter(in)
    in(:,1) = [];
    in = sortrows(in);
    ret = 0;
    while size(in,1) > 1
        ret = ret + dist(in(1,:),in(2,:));
        in(1,:) = [];
    end
end

function ret = dist(in1,in2)
    ret = sqrt( abs(in1(1)-in2(1))^2 + abs(in1(2)-in2(2))^2 );
end

function sum = integ(in)
    sum = 0;
    dx = diff(in(:,1));
    i = 2;
    while i < length(in)
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