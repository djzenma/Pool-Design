function I = best_estimate_3d(x, y, z)
    Iy = zeros(length(y), 1);
    % best estimate on the Y dimension
    for i = 1:length(y)
        % Get all X points with same Y = Y(i)
        Y = z(i, :);
        Iy(i) = best_estimate_2D(x, Y);
    end
    % best estimate on the X dimension
    [y_sorted, idx] = sort(y);
    Iy_reordered = Iy(idx);
    I = best_estimate_2D(y_sorted, Iy_reordered);
end