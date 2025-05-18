function music_notes=make_notes(music, fs, notes, freqs)    
    music = music.';
    i = 0;
    cur_part_of_the_music = [];
    detected_notes = [];
    while(i<length(music)-1)
        i = i+1;
        if (music(i) == 0 && music(i+1) == 0)
            detected_notes{length(detected_notes)+1} = cur_part_of_the_music;
            cur_part_of_the_music = [];
            while(music(i) == 0 && i < length(music))
                i = i+1;
            end
        end
        cur_part_of_the_music(length(cur_part_of_the_music)+1) = music(i);
    end
    
    thresh = 10;
    for i=1:length(detected_notes)
        x = detected_notes{i};
        dtft = fftshift(fft(x));
        fabs = abs(dtft);
        [~, col] = find(fabs == max(fabs));
        frequency = (col(2)-(length(x)/2)-1)*(fs/(length(x)));
        idx = find(abs(freqs-frequency)<thresh);
        music_notes{1, i} = notes(idx);
        music_notes{2, i} = length(x)/fs;
    end
    

