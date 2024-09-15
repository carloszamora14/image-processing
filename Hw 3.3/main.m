clear
close all

image = imread('https://www.pixelstalk.net/wp-content/uploads/image10/Tranquil-pond-surrounded-by-reeds-dragonflies-soft-evening-light-Nature-Wallpaper.jpg');
% image = rgb2gray(image);

imagenFinalR = ecualizarImagen(image(:, :, 1), 255);
imagenFinalG = ecualizarImagen(image(:, :, 2), 255);
imagenFinalB = ecualizarImagen(image(:, :, 3), 255);

figure;
subplot(1, 2, 1);
imshow(image);

subplot(1, 2, 2);
imshow(cat(3, imagenFinalR, imagenFinalG, imagenFinalB));

exportgraphics(gcf, 'cambioFrecuencias.png', 'Resolution', 1200);
