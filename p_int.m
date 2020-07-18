function sum = p_int(in)
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