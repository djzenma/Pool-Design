function I = int_pts(x,y,z)
    [x, y, z] = reorder(x, y, z); 
    I = int_best_estimate_3d(x, y, z);
end