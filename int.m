clc;
clear;
close all;

format long

x = [0 0.05 0.15 0.25];
y = [0 1];
z = [1 2 3 4    % x = C, y = R, z = C(R, C)
     5 6 7 8];
 
%[x, y] = sort_x(x, y)
I = best_estimate_3d(x, y, z);

disp(['I ~ ', num2str(I)]);


function [x, y_new] = sort_x(x, y)
    y_new = zeros(1, length(y));
    [x, idx] = sort(x);
    for i = 1 : length(y)
        y_new(i) = y(idx(i));
    end
end


function I = best_estimate_3d(x, y, z)
    Iy = zeros(length(y), 1);
    % best estimate on the Y dimension
    for i = 1:length(y)
        % Get all X points with same Y = Y(i)
        Y = z(i, :);
        Iy(i) = best_estimate_2d(x, Y);
    end
    % best estimate on the X dimension
    I = best_estimate_2d(y, Iy);
end

function I = best_estimate_2d(x, y)
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