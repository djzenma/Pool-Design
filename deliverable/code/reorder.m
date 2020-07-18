function [x, y_new, z_new] = reorder(x, y, z)
    y_new = zeros(1, length(y));
    z_new = zeros(size(z));
    % Reorder X
    [x, idx] = sort(x);     % idx the index where the current element should be
    % Reorder Y
    y_new(:) = y(idx);
    % Reorder Rows
    z_new(:,:) = z(idx, :);
    % Reorder Columns
    z_new(:,:) = z_new(:, idx);
end