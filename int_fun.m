function I = int_fun(f)
    num_pts = 10;
    step = 1;
    
    X = 0:step:num_pts-1;
    Y = 0:step:num_pts-1;
    Z = zeros(num_pts/step, num_pts/step);
    
    syms x y;
    for i = 1:step:num_pts
        x = i-1;
        y = 0:step:num_pts-1;
        Z(:,i) = subs(f);
    end
    [X, Y, Z] = reorder(X, Y, Z); 
    I = int_best_estimate_3d(X, Y, Z);
end