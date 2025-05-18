function [labeled_image, num_components] = mysegmentation(binary_image)
    [labeled_image,labels] = find_components(binary_image);
    num_components = labels;
    disp(num_components)
    %imshow(labeled_image)
end