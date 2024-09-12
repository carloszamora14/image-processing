clear
close all

image = imread('https://www.pixelstalk.net/wp-content/uploads/image10/Tranquil-pond-surrounded-by-reeds-dragonflies-soft-evening-light-Nature-Wallpaper.jpg');
image = rgb2gray(image);
image = double(image);

im = min(min(image));
iM = max(max(image));

im_n = input('Ingresa el nuevo valor mínimo');
iM_n = input('Ingresa el nuevo valor máximo');

output = (((image - im) / (iM - im)) * (iM_n - im_n)) + im;

figure;
subplot(2, 2, 1);
imshow(uint8(image));

subplot(2, 2, 2);
imshow(uint8(output));

subplot(2, 2, 3);
imhist(uint8(image));

subplot(2, 2, 4);
imhist(uint8(output));

% imwrite(uint8(output), 'result.png');

% image = imread('result.png');
% % image = rgb2gray(image);
% image = double(image);
%
% im = min(min(image));
% iM = max(max(image));
%
% im_n = input('Ingresa el nuevo valor mínimo');
% iM_n = input('Ingresa el nuevo valor máximo');
%
% output = (((image - im) / (iM - im)) * (iM_n - im_n)) + im;
%
% figure;
% subplot(1, 2, 1);
% imshow(uint8(image));
%
% subplot(1, 2, 2);
% imshow(uint8(output));
