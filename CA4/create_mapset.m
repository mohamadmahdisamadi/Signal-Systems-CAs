function mapset=create_mapset(chars)
    num_chars = length(chars);
    coded_binary_length = ceil(log2(num_chars));
    mapset=cell(2, num_chars);
    for i=1:num_chars
        mapset{1,i}=chars(i);
        mapset{2,i}=dec2bin(i-1, coded_binary_length);
    end
end