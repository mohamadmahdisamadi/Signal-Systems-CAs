clc;
close all;
clearvars;

T = 0.5;
notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
freqs = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, ...
         739.99, 783.99, 830.61, 880, 932.33, 987.77];

[music,fs] = audioread("mysong.wav");
music_notes = make_notes(music, fs, notes, freqs);