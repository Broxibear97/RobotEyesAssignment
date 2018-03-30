function [disparity_map] = DISP_MAP(left_image_filename, right_image_filename,...
    convert_to_bw, block_size, disparity_range)

    if(convert_to_bw == 0)
        p_left = imread(left_image_filename);
        p_right = imread(right_image_filename);
    else
        p_left = rgb2gray(imread(left_image_filename));
        p_right = rgb2gray(imread(right_image_filename));
    end

    [max_cols, max_rows] = size(p_left);
    disparity_map = zeros(size(p_left, 1), size(p_left, 2));

    % we want to loop through each pixel in the left image.
    for col = 1 : max_cols
        for row = 1 : max_rows 
           [best_value, best_point, disparity_vector] = PIXEL_DISP(row, col, p_left(col, row), p_right, block_size, disparity_range);         
           disparity_map(col, row) = abs(best_value);
           
           % resulting image is probably really dark because i havent
           % mapped the value between 0 and 255 yet.
           % so it becomes either black, or white.
           
        end
    end
    
    disp(disparity_map);
    figure
    imshow(disparity_map, []);
end