h = input("enter step");
d = input("enter depth");

i = 0;
while i < d
    print("for depth ", i);
    h_sum = 0;
    x = input("enter points of upper curve to evaluate: ");
    x = x - min(x);
    h_sum = h_sum + p_get_len(x);
    x = input("enter points of lower curve to evaluate: ");
    x = x - min(x);
    h_sum = h_sum + p_get_len(x);
    peri = [peri,h_sum];
    i = i + h;
end

peri = int(peri);

x = print("enter points for top half of bottom of pool: ");
x = abs(sortrow(x));
x0 = print("enter points for bottom half of bottom of pool: ");
x0 = abs(sortrow(x0));

peri = peri + p_int(x) + p_int(x0);

disp(peri)

function sum = p_get_len(in)
    x = abs(sortrow(in));
    sum = 0;
    for i = 1: size(x,1)-1
        sum = sum + sqrt( abs(in(i,1)-in(i+1,1))^2 + abs(in(i,2)-in(i+1,2))^2 );
    end
end


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