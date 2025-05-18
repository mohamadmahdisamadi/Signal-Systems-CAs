function [corr_mix, corr_max, bbox] = rgb_corr2(template, pic)
    corrRed = normxcorr2(template(:, :, 1), pic(:, :, 1));
    corrGrn = normxcorr2(template(:, :, 2), pic(:, :, 2));
    corrBlu = normxcorr2(template(:, :, 3), pic(:, :, 3));
    corr_mix = (corrRed + corrGrn + corrBlu) / 3;

    [corr_max, corrIdx] = max(abs(corr_mix(:)));
    [peakY, peakX] = ind2sub(size(corr_mix), corrIdx(1));
    corr_offset = [peakX - size(template, 2), peakY - size(template, 1)];
    bbox = [corr_offset(1), corr_offset(2), size(template, 2), size(template, 1)];
end