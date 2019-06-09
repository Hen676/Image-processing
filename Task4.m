% MATLAB script for Assessment Item-1
% Task-3
clear; close all; clc;

%% Load input image
I = imread('Starfish.jpg');

%% Conversion of input image to grey-scale image
Igray = rgb2gray(I);

%% Remove noise
Image = medfilt2(Igray,[5,5]);

figure;
imshow(Igray, [0 255]);
figure;
imshow(Image, [0 255]);
%% Invert Image
Image = imcomplement(Image);

figure;
imshow(Image, [0 255]);
%% set image to binary
threshold = graythresh(Image);
Image = im2bw(Image, (threshold - 0.06));
Image = bwareaopen(Image, 400);

figure;
imshow(Image, [0 1]);
axis on
%%
[y1 , x1] = size(Image);
mask = zeros(y1,x1);

blobs = regionprops(Image, 'all');

for k = 1:length(blobs)
    Xc = round(blobs(k).BoundingBox(3))/2;
    Yc = round(blobs(k).BoundingBox(4))/2;
    perimeter = bwboundaries(blobs(k).FilledImage);
    
    distC = ((Yc - perimeter{1}(:,1)).^2+(Xc - perimeter{1}(:,2)).^2).^0.5;
    
    data = smooth(distC);
    
    figure;
    title(k)
    plot(data);
    axis on
    
    peak = findpeaks(data);
    valley = findpeaks(-data);
    MID = (max(peak) + min(peak))/3;
    
    peak = find(peak > MID);
    [peak,temp] = size(rmmissing(peak));
    
    valley = find(valley > -MID);
    [valley,temp] = size(rmmissing(valley));
    
    
    
    if (valley == 5) && ((peak == 4) || (peak == 5))
        xt = blobs(k).BoundingBox(1)-0.5;
        yt = blobs(k).BoundingBox(2)-0.5;
        xb = blobs(k).BoundingBox(3)-1;
        yb = blobs(k).BoundingBox(4)-1;
        mask(yt:yt+yb,xt:xt+xb)=blobs(k).FilledImage;
    end
end


%% Show Image
figure;
imshow(mask, [0 1]);
axis on