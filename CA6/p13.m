function p13(y)
    fc = 5; fs = 100;
    B = 0.3; C = 3e8; p = 2/C;
    dtft = fftshift(fft(y));
    phase = angle(dtft);
    fabs = abs(dtft);
    [~,col] = find(fabs==max(fabs));
    max(fabs)
    pos_peak_idx = col(2);
    phase = abs(phase(pos_peak_idx));
    fnew = (pos_peak_idx-(length(dtft)/2)-1)*(fs/(length(dtft)));
    fd = fnew-fc; td = phase/(fnew*2*pi);
    v = (fd/B); R = td/p;

%    figure;
%    subplot(1, 2, 1); plot(y);
%    subplot(1, 2, 2); plot(dtft);     
    fprintf("calculated distance is %d\n", round(R, 1));
    fprintf("calculated speed is %d\n", round(v, 1));
