function binary_picture = mybinaryfun(gray_picture,thr)
    [row, col, ~] = size(gray_picture);
    binary_picture = zeros(row, col); 
    for i = 1:row
        for j = 1:col
            if gray_picture(i, j) > thr
                binary_picture(i, j) = 1;
            else
                binary_picture(i, j) = 0;
            end
        end
    end
    %imshow(binary_picture)
end