function cleaned_image = myremovecom(binary_image,n)
    [labeled_image,labels] = find_components(binary_image);
    for i=1 : labels 
        if sum(labeled_image(:) == i) < n
            labeled_image(labeled_image == i) = 0;
        end
    end
    cleaned_image = labeled_image > 0;
    %imshow(cleaned_image)
end