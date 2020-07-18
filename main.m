clc;
clear;
close all;

format long;



is_pts = input('Points (0) or Function (1) ? [0] : ');
if isempty(is_pts) || ~is_pts
    % Integrate Points
    pts = csvread('data/pool1.csv', 1, 0);
    fprintf('%s\nSuccessfuly Read %d points, each of size %d\n%s\n', repelem('-', 50), size(pts), repelem('-', 50));
    
    [X, Y, Z] = preprocess(pts);
    fprintf("\n%s\nNumerical Points Integration: \n I ~ %10.10f\n%s\n", repelem('*', 50), int_pts(X, Y, Z), repelem('*', 50));
else
    % Integrate Function
    syms x;
    z_num = input('Enter number of z levels: ');
    I = zeros(z_num, 2);
    for i=1:z_num
        I(i, 1) = input('Enter z level: ');
        f1 = input(['Enter f1(x) at z = ' , num2str(I(i, 1)), ': ']);
        f2 = input(['Enter f2(x) at z = ' , num2str(I(i, 1)), ': ']);
        x_lower = input('Enter x lower limit: ');
        x_upper = input('Enter x upper limit: ');
        if x_lower < 0
            x_upper = x_upper + abs(x_lower);
            x_lower = 0;
        end
        I(i, 2) = int(sym(f1), x_lower, x_upper) + int(sym(f2), x_lower, x_upper);
    end
    fprintf("\n%s\nFunction Integration: \n I ~ %10.10f\n%s\n", repelem('*', 50), best_estimate_2D(I(:,1), I(:,2)), repelem('*', 50));
end


% Cube Test
%x = [2 0 1.5 0.5 1];        % Notice I took the corners: (0, 0), (0,2), (2,0), (2,2)
%y = [0 2 1 0.5 1.5];
%z = [2 2 2 2 2              % x = Col, y = Row, z = f(Row, Col)
%     2 2 2 2 2
%     2 2 2 2 2
%    2 2 2 2 2
%     2 2 2 2 2];