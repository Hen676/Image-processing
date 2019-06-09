% MATLAB script for Assessment Item-1
% Task-2
clear; close all; clc;

%% Load input image
I = imread('Noisy.png');

%% Conversion of input image to grey-scale image
Igray = rgb2gray(I);

%% Find X and Y of image And pad image
Igray = padarray(Igray,[2,2],'both');
[y1 , x1] = size(Igray);

%% create Mean and Median Blank Images
Mean = zeros([y1,x1]);
Median = zeros([y1,x1]);

%% loop through image mean
for i=3:(x1-3)
    for j=3:(y1-3)
        %% 5x5 matrix around I J
        x = [Igray(j-2,i-2),Igray(j-1,i-2),Igray(j,i-2),Igray(j+1,i-2),Igray(j+2,i-2)
            Igray(j-2,i-1),Igray(j-1,i-1),Igray(j,i-1),Igray(j+1,i-1),Igray(j+2,i-1)
            Igray(j-2,i),Igray(j-1,i),Igray(j,i),Igray(j+1,i),Igray(j+2,i)
            Igray(j-2,i+1),Igray(j-1,i+1),Igray(j,i+1),Igray(j+1,i+1),Igray(j+2,i+1)
            Igray(j-2,i+2),Igray(j-1,i+2),Igray(j,i+2),Igray(j+1,i+2),Igray(j+2,i+2)];
        %% mean value
        Mean(j,i) = mean (x,'all');
    end
end
%% loop through image median
for i=3:(x1-3)
    for j=3:(y1-3)
        %% 5x5 matrix around I J
         x = [Igray(j-2,i-2),Igray(j-1,i-2),Igray(j,i-2),Igray(j+1,i-2),Igray(j+2,i-2)
            Igray(j-2,i-1),Igray(j-1,i-1),Igray(j,i-1),Igray(j+1,i-1),Igray(j+2,i-1)
            Igray(j-2,i),Igray(j-1,i),Igray(j,i),Igray(j+1,i),Igray(j+2,i)
            Igray(j-2,i+1),Igray(j-1,i+1),Igray(j,i+1),Igray(j+1,i+1),Igray(j+2,i+1)
            Igray(j-2,i+2),Igray(j-1,i+2),Igray(j,i+2),Igray(j+1,i+2),Igray(j+2,i+2)];
        %% median value
        Median(j,i) = median(x,'all');
    end
end
%% Remove padding
Mean = Mean(3:(y1-3),3:(x1-3));
Median = Median(3:(y1-3),3:(x1-3));
%% write Final Image
figure;
imshow(Mean, [0 255]);
figure;
imshow(Median, [0 255]);