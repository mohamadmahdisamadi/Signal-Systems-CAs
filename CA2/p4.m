vidObj = VideoReader('car_vid.mp4');
timestamp = 3.9; % Accessing the frame at 1 seconds
frame_number = round(vidObj.FrameRate * timestamp);
vidObj.CurrentTime = (frame_number - 1) / vidObj.FrameRate;
frame1 = readFrame(vidObj);
imshow(frame1);
imwrite(frame1, 'plate_frame.png');

timestamp = 4; % Accessing the frame at 1.5 seconds
frame_number = round(vidObj.FrameRate * timestamp);
vidObj.CurrentTime = (frame_number - 1) / vidObj.FrameRate;
frame2 = readFrame(vidObj);
imshow(frame2);

gray1 = rgb2gray(frame1);
gray2 = rgb2gray(frame2);
points1 = detectSURFFeatures(gray1);
points2 = detectSURFFeatures(gray2);
[features1, validPoints1] = extractFeatures(gray1, points1);
[features2, validPoints2] = extractFeatures(gray2, points2);
indexPairs = matchFeatures(features1, features2);
matchedPoints1 = validPoints1(indexPairs(:, 1), :);
matchedPoints2 = validPoints2(indexPairs(:, 2), :);
displacements = matchedPoints2.Location - matchedPoints1.Location;
averageDisplacement = mean(sqrt(sum(displacements.^2, 2)));
timeInterval = 0.1;
velocity = averageDisplacement / timeInterval;
disp(['Velocity: ', num2str(velocity), ' pixels per second']);

[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
subplot(3,3,1)
imshow(picture)
title('Original Image')

%2
cropfunc(picture);
picture=imread("cropped_pic.jpg");
subplot(3,3,2)
imshow(picture)
title('Cropped Image')

%3
picture=imresize(picture,[300 500]);
subplot(3,3,3)
imshow(picture)
title('Resized Image')


%4
picture=rgb2gray(picture);
subplot(3,3,4)
imshow(picture)
title('Grayscal Image')

%5
%threshold = graythresh(picture);
threshold = 0.35;
picture =~imbinarize(picture,threshold);
subplot(3,3,5)
imshow(picture)
title('Binary Image')

%6
number_of_pixels=700;
picture = bwareaopen(picture,number_of_pixels);
background=bwareaopen(picture,5500);
picture=picture-background;
subplot(3,3,6)
imshow(picture)
title('Clean Image')

%7
[picture,Ne]=bwlabel(picture);
subplot(3,3,8)
imshow(picture)
title('Segmentated Image')

%8
load TRAININGSETPER;
totalLetters=size(TRAINPER,2);

figure
final_output=[];
for n=1:Ne
    [r,c]=find(picture==n);
    Y=picture(min(r):max(r),min(c):max(c));
    imshow(Y)
    Y=imresize(Y,[42,24]);
    imshow(Y)
    pause(0.2)

    ro=zeros(1,totalLetters);
    for k=1:totalLetters
        ro(k)=corr2(TRAINPER{1,k},Y);
    end
    [MAXRO,pos]=max(ro);
    if MAXRO>.5
        out=cell2mat(TRAINPER(2,pos));       
        final_output=[final_output out];
    end
end

%9
disp(final_output);
file = fopen('Number_Plate_4.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('Number_Plate_4.txt')