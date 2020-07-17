clc;
clear;
close all;

format long;

%x = [1 0.5 0];
%y = [1 0.5 0];
%z = [0 1 2
%     3 4 5
%     6 7 8];

% Cube Test
x = [2 0 1.5 0.5 1];        % Notice I took the corners: (0, 0), (0,2), (2,0), (2,2)
y = [0 2 1 0.5 1.5];
z = [2 2 2 2 2              % x = Col, y = Row, z = f(Row, Col)
     2 2 2 2 2
     2 2 2 2 2
     2 2 2 2 2
     2 2 2 2 2];
 
% Integrate Points
fprintf("Numerical Points Integration: \n I ~ %10.10f\n", int_pts(x,y,z));

% Integrate Function
syms x y;
f = x^2 + y;
fprintf("Numerical Function Integration: \n I ~ %10.10f\n", int_fun(f));




