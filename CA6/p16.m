function p16(y)
    fc = 5; fs = 100;
    B = 0.3; C = 3e8; p = 2/C;
    
    dtft = fftshift(fft(y)); phase = angle(dtft); fabs = abs(dtft);
    max1 = 1; max2 = 1;
    for i=2:length(fabs)
        if (fabs(i) > fabs(max1))
            max1 = i;
        end
    end
    if (fabs(1) == max(fabs))
        max2 = 2;
    end
    for i=2:length(fabs)
        if ((fabs(i) > fabs(max2)) && (fabs(i) ~= fabs(max1)))
            max2 = i;
        end
    end
    [~, col1] = find(fabs==fabs(max1)); [~, col2] = find(fabs==fabs(max2));
    
    phase1 = abs(phase(col1(2)));
    fnew1 = (col1(2)-(length(y)/2)-1)*(fs/(length(y)));
    fd1 = fnew1-fc; td1 = phase1/(fnew1*2*pi);
    phase2 = abs(phase(col2(2)));
    fnew2 = (col2(2)-(length(y)/2)-1)*(fs/(length(y)));
    fd2 = fnew2-fc; td2 = phase2/(fnew2*2*pi);
    v1 = fd1/B; R1 = td1/p; v2 = fd2/B; R2 = td2/p - 1000;

    fprintf("calculated distances are %d and %d \n", round(R1, 1), round(R2, 1));
    fprintf("calculated speeds are %d and %d\n", round(v1, 1), round(v2, 1));
