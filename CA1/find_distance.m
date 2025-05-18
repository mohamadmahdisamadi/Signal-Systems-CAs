function [distance, correlation]=find_distance(signal, template)
    len_t = length(template);
    len_s = length(signal);
    correlation = zeros(1, len_s - len_t - 1);
    
    for i = 1 : length(correlation)
        correlation(i) = dot(template, signal(i:i+len_t-1));
    end

    [~, idx] = max(correlation);
    C = 3e8 ;
    ts = 1e-9;
    td = (idx - 1) * ts;
    distance = td * C / 2;
end
