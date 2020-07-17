clc;
clear;
close all;

format long;

%x = [1 0.5 0];
%y = [1 0.5 0];
%z = [0 1 2
%     3 4 5
%     6 7 8];


is_pts = input('Points (0) or Function (1) ? [0] : ');
if isempty(is_pts) || ~is_pts
    % Integrate Points
    % Cube Test
    x = [2 0 1.5 0.5 1];        % Notice I took the corners: (0, 0), (0,2), (2,0), (2,2)
    y = [0 2 1 0.5 1.5];
    z = [2 2 2 2 2              % x = Col, y = Row, z = f(Row, Col)
         2 2 2 2 2
         2 2 2 2 2
         2 2 2 2 2
         2 2 2 2 2];
    fprintf("Numerical Points Integration: \n I ~ %10.10f\n", int_pts(x,y,z));
else
    % Integrate Function
    syms x y;
    x_lim = input('Enter x upper limit: ');
    y_lim = input('Enter y upper limit: ');
    f = input('Enter the function: ');
    fprintf("Numerical Function Integration: \n I ~ %10.10f\n", int_fun(f, x_lim, y_lim));
end
