function [ color ] = findFeat(img_rgb)
%Used to detect the color of an object that is already segmented out of the background

%% Color Determination  
%initialization
color = NaN;
img = rgb2hsv(img_rgb);
Edges = [1, 13, 42, 70, 167, 252, 306]; %based on HSV 0-360
img = img*360; %to get HSV into 255 range
[ysize, xsize, ~] = size(img);

imgHue = img(:,:,1);
[N, Bins] = histc(imgHue(:), Edges);
color = find(N==max(N)) ;

assignin('base', 'imgHue',imgHue);
end



