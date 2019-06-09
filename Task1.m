% MATLAB script for Assessment Item-1
%% Task-1
clear; close all; clc;

%% Load input image
I = imread('Zebra.jpg');

%% Conversion of input image to grey-scale image
Igray = rgb2gray(I);

%% Find X and Y of image And pad image
[y1 , x1] = size(Igray);
Igray = padarray(Igray,[1,1],'both');

%% Create base of new image
x2 = x1 * 3;
y2 = y1 * 3;
I_NN = zeros(y2,x2);
I_B = zeros(y2,x2);

%% loop new image for NN
for i=1:x1
    for j=1:y1
        pixel = Igray(j,i);
        pixelM = [pixel, pixel, pixel;pixel, pixel, pixel; pixel, pixel, pixel];
        I_NN((j*3)-2:(j*3),(i*3)-2:(i*3)) = pixelM;
    end
end

%% loop new image for B
for i=1:x1
    for j=1:y1
        %% pixel billnear algorithim
        pixel_1 = Igray(j,i);
        
        third_1 = (2/3)*Igray(j+1,i) + (1/3)*Igray(j+1,i+1);
        third_2 = (1/3)*Igray(j+1,i) + (2/3)*Igray(j+1,i+1);
        
        pixel_2 = (2/3)*Igray(j,i) + (1/3)*Igray(j,i+1);
        pixel_3 = (1/3)*Igray(j,i) + (2/3)*Igray(j,i+1);
        pixel_4 = (2/3)*Igray(j,i) + (1/3)*Igray(j+1,i);
        pixel_5 = (1/3)*third_1 + (2/3)*pixel_2;
        pixel_6 = (1/3)*third_2 + (2/3)*pixel_3;
        pixel_7 = (1/3)*Igray(j,i) + (2/3)*Igray(j+1,i);
        pixel_8 = (2/3)*third_1 + (1/3)*pixel_2;
        pixel_9 = (2/3)*third_2 + (1/3)*pixel_3;
        %% Add Pixel Matrix
        pixelM = [pixel_1, pixel_2, pixel_3; pixel_4, pixel_5, pixel_6; pixel_7, pixel_8, pixel_9];
        % 1 2 3
        % 4 5 6
        % 7 8 9
        I_B((j*3)-2:(j*3),(i*3)-2:(i*3)) = pixelM;
    end
end
%% write Final Image
figure;
imshow(I_NN, [0 255]);
figure;
imshow(I_B, [0 255]);