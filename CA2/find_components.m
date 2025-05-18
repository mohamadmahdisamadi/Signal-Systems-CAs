function [labeled_img, num_labels] = find_components(binary_img)
    [rows, cols] = size(binary_img);
    labeled_img = zeros(rows, cols);
    label_count = 1;
    connectivity_dirs = [-1,0; 1,0; 0,-1; 0,1; -1,-1; -1,1; 1,-1; 1,1];
    
    for r = 1:rows
        for c = 1:cols
            if binary_img(r, c) == 1 && labeled_img(r, c) == 0
                stack = [r, c];
                
                while ~isempty(stack)
                    [current_r, current_c] = deal(stack(end, 1), stack(end, 2));
                    stack(end, :) = [];

                    if current_r > 0 && current_r <= rows && current_c > 0 && current_c <= cols
                        if binary_img(current_r, current_c) == 1 && labeled_img(current_r, current_c) == 0
                            labeled_img(current_r, current_c) = label_count;
                            for d = 1:size(connectivity_dirs, 1)
                                neighbor_r = current_r + connectivity_dirs(d, 1);
                                neighbor_c = current_c + connectivity_dirs(d, 2);
                                stack = [stack; neighbor_r, neighbor_c];
                            end
                        end
                    end
                end
                
                label_count = label_count + 1;
            end
        end
    end
    
    num_labels = label_count - 1;
end