function sum = p_get_len(in)
    x = abs(sortrow(in));
    sum = 0;
    for i = 1: size(x,1)-1
        sum = sum + sqrt( abs(in(i,1)-in(i+1,1))^2 + abs(in(i,2)-in(i+1,2))^2 );
    end
end