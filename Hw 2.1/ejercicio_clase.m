close all
clear
% I1 = imread('https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*');
% I2 = imread('https://res.cloudinary.com/hamstech/images/f_auto,q_auto/v1622735301/Hamstech%20App/title-image-Sky-Photography/title-image-Sky-Photography.jpg');
% I2 = imread('https://ashevillepictures.com/wp-content/uploads/2021/03/Sunset-over-the-balsam-range-sRGB-preview.jpg');
% figure, imshow(I1);

img1 = imread('im1.png');
img2 = imread('im2.png');

% figure;

% subplot(1, 3, 1);  % 1 row, 3 columns, first subplot
% imshow(I1(:,:,1));

% subplot(1, 3, 2);  % 1 row, 3 columns, second subplot
% imshow(I1(:,:,2));

% subplot(1, 3, 3);  % 1 row, 3 columns, third subplot
% imshow(I1(:,:,3));

% figure, imshow(I1(:,:,2));

figure;
% cI = imcrop(I1, [(1197-1024)/2, (1200-768)/2, 1023, 767]);
% img1 = imcrop(I1, [0, (1197 - 901)/2, 1200, 901 - 1]);
% img2 = imcrop(I2, [(1349 - 1200)/2, 0, 1200 - 1, 901]);
% size(cI)

rows = min(size(img1, 1), size(img2, 1));
cols = min(size(img1, 2), size(img2, 2));

img1 = resizeImage(rows, cols, img1);
img2 = resizeImage(rows, cols, img2);

%result = 1.6 * cI1 + cI2;
%result(result > 255) = 255;
%imshow(result);

alpha = 0.4;
result = alpha * img1 + (1 - alpha) * img2;

result(result > 255) = 255;
result(result < 0) = 0;

result = uint8(result);
imshow(result);
imwrite(result, 'result.png', 'png');
