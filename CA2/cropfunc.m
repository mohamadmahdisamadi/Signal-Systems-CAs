function croppic = mycrop(full_picture)
    % Convert the input image to grayscale for feature detection
    gray_picture = rgb2gray(full_picture);

    % Detect SURF features around the plate (or car region)
    points = detectSURFFeatures(gray_picture);

    % Extract the strongest feature points
    strongest_points = points.selectStrongest(50);

    % Find a bounding box around the strongest features
    [x, y] = deal(strongest_points.Location(:, 1), strongest_points.Location(:, 2));
    x_min = min(x); x_max = max(x);
    y_min = min(y); y_max = max(y);

    % Expand the bounding box to include more of the car
    padding_x = 0.5 * (x_max - x_min); % Expand horizontally by 50%
    padding_y = 0.8 * (y_max - y_min); % Expand vertically by 80%

    % Create the final bounding box with padding
    bounding_box = [max(1, x_min - padding_x), max(1, y_min - padding_y), ...
                    min(size(full_picture, 2), x_max + padding_x), ...
                    min(size(full_picture, 1), y_max + padding_y)];

    % Crop the image using the calculated bounding box
    croppic = imcrop(full_picture, bounding_box);

    % Resize the cropped image to 300x500 for further processing
    croppic = imresize(croppic, [300 500]);

    % Save and display the cropped image
    imwrite(croppic, 'cropped_pic.jpg');
    figure, imshow(croppic), title('Cropped Image');
end
