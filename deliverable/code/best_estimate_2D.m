function I = best_estimate_2D(x, y)
    dx=diff(x);
    i=1;
    I=0;
    if length(y) == 1
        I = y(1);
    else
        while i < length(y)
            if i+2 <= length(dx) && are_equal(dx(i), dx(i+1)) && are_equal(dx(i+1), dx(i+2))% 3 equal segments => Simpsons 3/8
                I_8 = simpsons_3_8(x, y, i);
                I = I + I_8;
                i = i + 3;
            elseif i+1 <= length(dx) && are_equal(dx(i), dx(i+1))  % 2 equal segments => Simpsons 1/3
                I3 = simpsons_1_3(x, y, i);
                I = I + I3;
                i = i + 2;
            else   % no equal segments => trapezoidalezoidal
                It = trapezoidal(x, y, i);
                I = I + It;
                i = i + 1;
            end
        end
    end
end

function flag = are_equal(a, b)
    flag = abs(a-b)<0.0000001;
end

function I = trapezoidal(x, y, i)
    I = (y(i) + y(i+1)) / 2 * (x(i+1) - x(i));
end

function I = simpsons_1_3(x, y, i)
    I = (y(i) + 4*y(i+1) + y(i+2)) * (x(i+1) - x(i)) / 3;
end

function I = simpsons_3_8(x, y, i)
    I = 3/8 * (y(i) + 3*y(i+1) + 3*y(i+2) + y(i+3)) * (x(i+1) - x(i));
end