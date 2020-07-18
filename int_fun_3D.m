function I = int_fun_3D(f)
    z = f(:,4);
    Iz = zeros(length(z));
    for i=1:length(z)
        Iz(i) = int_fun_2D(f(i,1), f(i,2), f(i,3));
    end
    I = best_estimate_2D(z, Iz);
end

function int_f = int_fun_2D(f, x_lower, x_upper)
    syms x;
    int_f = int(f, x_lower, x_upper);
end