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
 
[x, y, z] = reorder(x, y, z); 
I = int_best_estimate_3d(x, y, z);
disp(['I ~ ', num2str(I)]);

