function bounding_box = p3(picture_full)
    RESIZE_WIDTH = 800;
    ERR_MARGIN = 10;
    BLUE2PLATE_RATIO = 14;
    CORRELATION_THRESHOLD = 0.5;

    blue_part_org = imread('blue_part.png');

    picture = imresize(picture_full, [NaN, RESIZE_WIDTH]);
    ratio = size(picture_full, 1) / size(picture, 1);

    [corr_mix, corr_max, bbox] = rgb_corr2(blue_part_org, picture);

    for r=0.2:0.2:10
        % resizing the picture by a scale
        blue_part = imresize(blue_part_org, r);
        if size(picture, 1) > size(blue_part, 1)
            [new_corr_mix, new_corr_max, new_bbox] = rgb_corr2(blue_part, picture);
            if new_corr_max > corr_max
                if new_corr_max > CORRELATION_THRESHOLD
                    corr_max = new_corr_max;
                    corr_mix = new_corr_mix;
                    bbox = new_bbox;
                end
            end
        end
    end

    blue_part_org2 = imread('blue_part2.png');

    picture = imresize(picture_full, [NaN, RESIZE_WIDTH]);
    ratio = size(picture_full, 1) / size(picture, 1);

    for r=0.2:0.2:10
        % resizing the picture by a scale
        blue_part2 = imresize(blue_part_org2, r);
        if size(picture, 1) > size(blue_part2, 1)
            [new_corr_mix, new_corr_max, new_bbox] = rgb_corr2(blue_part2, picture);
            if new_corr_max > corr_max
                if new_corr_max > CORRELATION_THRESHOLD
                    corr_max = new_corr_max;
                    corr_mix = new_corr_mix;
                    bbox = new_bbox;
                end
            end
        end
    end



    if corr_max < CORRELATION_THRESHOLD
        fprintf("%s", "DID NOT FOUND THE BLUE PART");
    end
    if corr_max >= CORRELATION_THRESHOLD
        bbox_full = [round((bbox(1) - ERR_MARGIN) * ratio), ...
                    round((bbox(2) - ERR_MARGIN) * ratio), ...
                    round((bbox(3) + 2 * ERR_MARGIN) * ratio), ...
                    round((bbox(4) + 2 * ERR_MARGIN) * ratio)];
    
        bounding_box = bbox_full;
        bounding_box(3) = BLUE2PLATE_RATIO * bbox(3) * ratio;

        bounding_box
  
        figure;
        cols = 1;
        rows = 3;
        cnt = 1;
        subplot(rows, cols, cnt);
        cnt = cnt + 1;
        imshow(picture);
        title('Picture')

        subplot(rows, cols, cnt);
        cnt = cnt + 1;
        imshow(picture_full);
        rectangle('Position', bbox_full, 'edgecolor', 'r', 'linewidth', 2);
        rectangle('Position', bounding_box, 'edgecolor', 'g', 'linewidth', 1);
        title("Bounding boxes around the detected parts");


        subplot(rows, cols, cnt);
        imshow(imcrop(picture_full, bounding_box));
        title("The cropped part");
    end
end

