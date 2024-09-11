close all
clear

img1 = imread('https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*');
img2 = imread('https://ashevillepictures.com/wp-content/uploads/2021/03/Sunset-over-the-balsam-range-sRGB-preview.jpg');

% img2 = imread('im1.png');
% img1 = imread('im2.png');

figure % , sgtitle('Imágenes Originales');
subplot(1, 2, 1), imshow(img1); % title('Imagen Original');
subplot(1, 2, 2), imshow(img2); % title('Imagen Original');

saveas(gcf, 'originales.png'); % Saves in PNG format

rows = min(size(img1, 1), size(img2, 1));
cols = min(size(img1, 2), size(img2, 2));

img1 = resizeImage(rows, cols, img1);
img2 = resizeImage(rows, cols, img2);

figure;
subplot(1, 2, 2), imshow(img1); % title('Imagen Original')
subplot(1, 2, 1), imshow(img2); % title('Imagen recortada del fondo con imcrop')

saveas(gcf, 'recortadas.png'); % Saves in PNG format

figure, imshow(img1);
circ = drawcircle;
radius = fix(circ.Radius);
circleX = fix(circ.Center(1));
circleY = fix(circ.Center(2));

gaussian = fspecial('gaussian', 2 * radius, radius / 2);

gaussian = gaussian / max(max(gaussian));

maskZeros = zeros(rows, cols);

maskZeros( ...
    circleY - radius : circleY + radius - 1, ...
    circleX - radius : circleX + radius - 1 ...
) = gaussian;

figure;
imshow(maskZeros);

maskComplement = imcomplement(maskZeros);

maskedImg1 = double(img1) .* maskZeros;
maskedImg2 = double(img2) .* maskComplement;

figure, imshow(uint8(maskedImg1));
figure, imshow(uint8(maskedImg2));
figure, imshow(uint8(maskedImg1 + maskedImg2));
saveas(gcf, 'result.png');
