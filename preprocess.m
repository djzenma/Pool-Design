function [X, Y, Z] = preprocess(pts)
    % Push to 1st Quadrant
    pts(:,1) = push_quadrant(pts(:,1));
    pts(:,2) = push_quadrant(pts(:,2));
    pts(:,3) = push_quadrant(pts(:,3)); 
    

    X = unique(pts(:, 1), 'sorted');
    Y = unique(pts(:, 2), 'sorted');
    Z = zeros(length(X), length(Y));
    

    % TODO: Remove duplicates
    for i=1:length(Y)
        y_idx = find(pts(:, 2) == Y(i));
        % iterate over all matched rows and get their x
        for j = 1:length(y_idx)
            % Get all the Xs of the current y
            row_cur = pts(y_idx,:);     % get every matched row
            row_cur = row_cur(j,:);     % get current row
            x_idx = find(X == row_cur(:,1));    % Get index of the matched x 
            z_idx = find(pts(:,1)==row_cur(:,1) & pts(:,2)==row_cur(:,2));  % Get index of the Z matching the found X and Y
            Z(find(Y == row_cur(:,2)), x_idx) = pts(z_idx, 3);
        end
    end
end

function A = push_quadrant(A)
    if sum(any(A<0)) > 0     % a negative number exists
        A = A + abs(min(A));
    end
end
    