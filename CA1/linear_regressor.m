function [a, b] = linear_regressor(x, y)
    len = length(x);
    mu_x = mean(x);
    mu_y = mean(y);
    xx = zeros(1, len);
    xy = zeros(1, len);

    for i = 1:len
        xx(i) = x(i) * x(i);
        xy(i) = x(i) * y(i);
    end
    
    mu_xx = mean(xx);
    mu_xy = mean(xy);
    
    a = ((mu_x * mu_y) - mu_xy) / ((mu_x * mu_x) - mu_xx);
    b = mu_y - (a * mu_x);
end