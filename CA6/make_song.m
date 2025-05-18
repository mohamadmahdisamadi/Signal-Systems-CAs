function make_song(notes, freqs, song, name)
    tstart = 0; trest = 0.025; fs = 8000; ts = 1/fs;
    t_silence = tstart:ts:trest-ts; silence = zeros(size(t_silence));
    
    music = [];
    for i=1:length(song)
        note = song{1,i}; duration = song{2,i};
        [~, index] = find(notes==note);
        fc = freqs(index); t = tstart:ts:duration-ts;
        wave = cos(2*pi*fc*t);
        music = [music wave]; music = [music silence];
    end

    length(music)
    
    audiowrite(name, music, fs);
    %sound(music);