clear;
close all;

% image1 = imread('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2o3Sg3vTrCRUc_WDmLyTKBaRsHVyQJRzkpg&s');
image1 = imread('https://i0.wp.com/vacacionesporargentina.com/wp-content/uploads/2020/11/waterfall-5040210_1920.jpg?fit=1920%2C1272&ssl=1');
image2 = imread('https://img.freepik.com/foto-gratis/cascada-barco-limpio-china-natural_1417-1356.jpg?w=996&t=st=1728497979~exp=1728498579~hmac=6f5650e71fd9d23fddaf1a7b476bae0844a83a43f473a60f7a1bd07c9adc6171');

image1 = rgb2gray(image1);
image2 = rgb2gray(image2);

% output1 = ruidoimp(image2, 0.05, 0, 255);
%
% figure;
% subplot(1, 2, 1);
% imshow(image2);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(output1);
% title('Ruido impulsivo p = 0.05');
%
% exportgraphics(gcf, 'impulsivo-0.05.png', 'Resolution', 2400);
%
% output2 = ruidoimp(image2, 0.1, 0, 255);
%
% figure;
% subplot(1, 2, 1);
% imshow(image2);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(output2);
% title('Ruido impulsivo p = 0.1');
%
% exportgraphics(gcf, 'impulsivo-0.1.png', 'Resolution', 2400);

c1 = imnoise(image1, 'salt & pepper', 0.02); % Ruido sal y pimienta
d1 = imnoise(image1, 'speckle', 0.05); % Ruido multiplicativo
e1 = imnoise(image1, 'gaussian', 0, 0.02); % Ruido blanco Gaussiano

% figure;
% subplot(1, 2, 1);
% imshow(image1);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(c1);
% title('Ruido sal y pimienta');
%
% exportgraphics(gcf, 'sal-pimienta1.png', 'Resolution', 2400);
%
%
% figure;
% subplot(1, 2, 1);
% imshow(image1);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(d1);
% title('Ruido multiplicativo');
%
% exportgraphics(gcf, 'multiplicativo1.png', 'Resolution', 2400);
%
%
% figure;
% subplot(1, 2, 1);
% imshow(image1);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(e1);
% title('Ruido gaussiano');
%
% exportgraphics(gcf, 'gaussiano1.png', 'Resolution', 2400);

c2 = imnoise(image2, 'salt & pepper', 0.02); % Ruido sal y pimienta
d2 = imnoise(image2, 'speckle', 0.05); % Ruido multiplicativo
e2 = imnoise(image2, 'gaussian', 0, 0.02); % Ruido blanco Gaussiano

% figure;
% subplot(1, 2, 1);
% imshow(image2);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(c2);
% title('Ruido sal y pimienta');
%
% exportgraphics(gcf, 'sal-pimienta2.png', 'Resolution', 2400);
%
%
% figure;
% subplot(1, 2, 1);
% imshow(image2);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(d2);
% title('Ruido multiplicativo');
%
% exportgraphics(gcf, 'multiplicativo2.png', 'Resolution', 2400);
%
%
% figure;
% subplot(1, 2, 1);
% imshow(image2);
% title('Original');
%
% subplot(1, 2, 2);
% imshow(e2);
% title('Ruido gaussiano');
%
% exportgraphics(gcf, 'gaussiano2.png', 'Resolution', 2400);

b = 7;

mask1 = [1, 1, 1; 1, 2, 1; 1, 1, 1] / 10;
mask2 = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16;
mask3 = [1, b, 1; b, b * b, b; 1, b, 1] / ((b + 2) * (b + 2));

f1 = uint8(filter2(mask1, c1, 'valid'));
g1 = uint8(filter2(mask1, d1, 'valid'));
h1 = uint8(filter2(mask1, e1, 'valid'));


figure;
subplot(1, 2, 1);
imshow(c1);
title('Ruido sal y pimienta');

subplot(1, 2, 2);
imshow(f1);
title('Filtro con máscara h1');

exportgraphics(gcf, 'c1-h1.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(d1);
title('Ruido multiplicativo');

subplot(1, 2, 2);
imshow(g1);
title('Filtro con máscara h1');

exportgraphics(gcf, 'd1-h1.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(e1);
title('Ruido gaussiano');

subplot(1, 2, 2);
imshow(h1);
title('Filtro con máscara h1');

exportgraphics(gcf, 'e1-h1.png', 'Resolution', 2400);
