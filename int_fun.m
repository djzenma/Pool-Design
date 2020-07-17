function I = int_fun(f, x_lim, y_lim)
    step = 1;
    
    X = 0:step:x_lim;
    Y = 0:step:y_lim;
    Z = zeros((y_lim+1)/step, (x_lim+1)/step);
    
    syms x y;
    for i = 0:step:x_lim
        x = i;
        y = 0:step:y_lim;
        Z(:,i+1) = subs(f);
    end
    [X, Y, Z] = reorder(X, Y, Z);
    I = int_best_estimate_3d(X, Y, Z);
end