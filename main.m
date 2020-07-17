clc;
clear;
close all;

format long;

pts = csvread('data/pool1.csv', 1, 0);
fprintf('%s\nSuccessfuly Read %d points, each of size %d\n%s\n', repelem('-', 50), size(pts), repelem('-', 50));

[X, Y, Z] = preprocess(pts);

is_pts = input('Points (0) or Function (1) ? [0] : ');
if isempty(is_pts) || ~is_pts
    % Integrate Points
    fprintf("\n%s\nNumerical Points Integration: \n I ~ %10.10f\n%s\n", repelem('*', 50), int_pts(X, Y, Z), repelem('*', 50));
else
    % Integrate Function
    syms x y;
    x_lim = input('Enter x upper limit: ');
    y_lim = input('Enter y upper limit: ');
    f = input('Enter the function: ');
    fprintf("\n%s\nNumerical Function Integration: \n I ~ %10.10f\n%s\n", repelem('*', 50), int_fun(f, x_lim, y_lim), repelem('*', 50));
end


% Cube Test
%x = [2 0 1.5 0.5 1];        % Notice I took the corners: (0, 0), (0,2), (2,0), (2,2)
%y = [0 2 1 0.5 1.5];
%z = [2 2 2 2 2              % x = Col, y = Row, z = f(Row, Col)
%     2 2 2 2 2
%     2 2 2 2 2
%    2 2 2 2 2
%     2 2 2 2 2];