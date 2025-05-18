function final_output=p2(picture)
    figure;

    subplot(4, 2, 1);
    imshow(picture);
    title("raw picture");
    %%%
    picture=imresize(picture,[300 500]);
    subplot(4, 2, 2);
    imshow(picture);
    title("resized picture");
    %%%
    gray_picture = rgb2gray(picture);
    subplot(4, 2, 3);
    imshow(gray_picture);
    title("grayscale picture");
    %%%
    threshold = graythresh(gray_picture);
    picture = imbinarize(gray_picture,threshold);
    subplot(4, 2, 4);
    imshow(picture);
    title("black and white picture");

    %%%
    pic = bwareaopen(~picture,1000);
    subplot(4, 2, 5);
    imshow(pic);
    title("after removing small components");
    background=bwareaopen(~picture,10000);

    subplot(4, 2, 6);
    imshow(background);
    title("background of the picture");

    picture2=pic-background;
    subplot(4, 2, 7);
    imshow(picture2);
    title("only letters and numbers");

    %%%
    [labeled_image, num_components] = bwlabel(picture2);
    %%%
    load TRAININGSET_FARSI;
    
    totalLetters=size(TRAIN_FARSI,2);
    
    component_stats = regionprops(labeled_image, 'BoundingBox');
    bboxes = cat(1, component_stats.BoundingBox);
    [~, sort_idx] = sort(bboxes(:, 1));

    subplot(4, 2, 8);
    imshow(picture2);
    for n=1:num_components
        rectangle('Position',component_stats(n).BoundingBox,'EdgeColor','m','LineWidth',1)
    end
    title("rectangles around components");
    
    final_output=[];
    t=[];
    
    for i=1:num_components
        
        n = sort_idx(i);
        [r, c] = find(labeled_image == n);
        Y=labeled_image(min(r):max(r),min(c):max(c));

        ro=zeros(1,totalLetters);
        for k=1:totalLetters
            [row, col] = size(TRAIN_FARSI{1,k});
            Y2 = imresize(Y, [row, col]);
            ro(k)=corr2(TRAIN_FARSI{1,k},Y2);

        end
        [MAXRO,pos]=max(ro);
        if MAXRO>.45
            out=TRAIN_FARSI{2,pos};       
            final_output=[final_output out];
        end
    end
    %8
    fileID = fopen('Farsi Plate.txt', 'w', 'n', 'UTF-8'); 
    fprintf(fileID, '%s\n', final_output); 
    fclose(fileID);