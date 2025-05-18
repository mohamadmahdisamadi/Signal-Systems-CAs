function gray_picture = mygrayfun(picture)
    [row, col, ~] = size(picture);
    gray_picture = zeros(row, col); 
    for i = 1:row
        for j = 1:col
            gray = 0.299 * picture(i, j, 1) + 0.587 * picture(i, j, 2) + 0.114 * picture(i, j, 3) ;
            gray_picture(i, j) = double(gray) / 255;
        end
    end
    %imshow(gray_picture)
end