clc
clearvars
close all

[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
picture=imread([path,file]);
train_p2();
plate = p2(picture);
plate