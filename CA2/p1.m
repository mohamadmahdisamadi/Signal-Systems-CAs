function final_output=p1()
    figure;
    %1
    [file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
    s=[path,file];
    picture=imread(s);
    subplot(4, 2, 1);
    imshow(picture);
    title("raw picture");

    %2
    picture=imresize(picture,[300 500]);
    subplot(4, 2, 2);
    imshow(picture);
    title("resized picture");
    
    %3
    gray_picture = mygrayfun(picture);
    subplot(4, 2, 3);
    imshow(gray_picture);
    title("grayscale picture");
    
    %4
    thr = 0.4;
    binary_picture = mybinaryfun(gray_picture,thr);
    subplot(4, 2, 4);
    imshow(binary_picture);
    title("black and white picture");

    %5
    cleaned_image = myremovecom(~binary_picture,500);
    subplot(4, 2, 5);
    imshow(cleaned_image);
    title("after removing small components");
    cleaned_image_background = myremovecom(~binary_picture,2500);
    subplot(4, 2, 6);
    imshow(cleaned_image_background);
    title("background of the picture");
    cleaned_image_letters = cleaned_image - cleaned_image_background;
    subplot(4, 2, 7);
    imshow(cleaned_image_letters);
    title("only letters and numbers");
    
    %6
    [labeled_image, num_components] = mysegmentation(cleaned_image_letters);
    %%%%
    
  
    %7
    load TRAININGSET_ENGLISH;
    totalLetters=size(TRAIN_ENGLISH,2);
    
    component_stats = regionprops(labeled_image, 'BoundingBox');
    bboxes = cat(1, component_stats.BoundingBox);
    [~, sort_idx] = sort(bboxes(:, 1));


    subplot(4, 2, 8);
    imshow(cleaned_image_letters);
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
        Y=imresize(Y,[42,24]);
        ro=zeros(1,totalLetters);
        for k=1:totalLetters   
            ro(k)=corr2(TRAIN_ENGLISH{1,k},Y);
        end
        [MAXRO,pos]=max(ro);
        if MAXRO>.45
            out=TRAIN_ENGLISH{2,pos};       
            final_output=[final_output out];
        end
    end

    %8
    file = fopen('English Plate.txt', 'wt');
    fprintf(file,'%s\n',final_output);
    fclose(file);
    

