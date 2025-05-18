clc
clearvars
close all

[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
picture=imread([path,file]);
bb = p3(picture);
cropped_plate = imcrop(picture, bb);
train_p2();
plate = p2(cropped_plate);
plate