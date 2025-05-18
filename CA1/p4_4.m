function y=p4_4(x, speed)
    old_len = length(x);
    new_len = round(old_len / speed);
    y = zeros(1, new_len);

    if rem(speed, 0.1) ~= 0
        fprintf('Speed argument must be divisible by 0.1!\n');
        return;
    end

    if (speed > 2) || (speed < 0.5)
        fprintf('Speed argument must be between 0.5 and 2!\n');
        return;
    end

    for i = 1:new_len
        org_idx = (i - 1) * speed + 1;
        if org_idx <= old_len
            low_idx = floor(org_idx);
            up_idx = ceil(org_idx);
            if low_idx == up_idx
                y(i) = x(low_idx);
            else
                delta_y = (org_idx - low_idx) * (x(up_idx) - x(low_idx));
                y(i) = x(low_idx) + delta_y;
            end
        end
    end
end
