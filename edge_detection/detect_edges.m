clc; clear all; close all;

img = imread('engine_part.png'); % does not consider alpha

if length(size(img)) == 3
    [height, width, channels] = size(img);

    % https://octave.sourceforge.io/image/function/rgb2gray.html
    % convert to grayscale
    gray_img = (
        0.298936 * img(:,:,1) +
        0.587043 * img(:,:,2) +
        0.114021 * img(:,:,3) + 0.5
    );
end

% Sobel operator
gx = int8([
    [1 0 -1];
    [2 0 -2];
    [1 0 -1];
]);

edged = gray_img;

% REFERENCE
% https://aryamansharda.medium.com/how-image-edge-detection-works-b759baac01e2
for y = 2 : width - 1
    for x = 2 : height - 1
        selection = int8(gray_img(x-1:x+1, y-1:y+1));

        intermediate = selection .* gx;
        px = sum(sum(intermediate, [1]));

        intermediate = selection .* transpose(gx);
        px2 = sum(sum(intermediate, [1]));

        edged(x, y) = floor(sqrt(px*px + px2*px2));
    end
end


% PLOTS
subplot(1, 2, 1);
plt = imshow(img);
title('Original Image', 'fontsize', 20)

subplot(1, 2, 2);
plt = imshow(edged);
title('Image after applying the Sobel Filter', 'fontsize', 20)

drawnow;
waitfor(plt);
