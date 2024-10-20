clear;
close all;

image1 = imread('https://i0.wp.com/vacacionesporargentina.com/wp-content/uploads/2020/11/waterfall-5040210_1920.jpg?fit=1920%2C1272&ssl=1');
image2 = imread('https://thehappening.com/wp-content/uploads/2024/08/th-cascadasmx.jpg');

image1 = rgb2gray(image1);
image2 = rgb2gray(image2);

output1 = ruidoimp(image1, 0.05, 0, 255);

figure;
subplot(1, 3, 1);
imshow(image1);
title('Original');

subplot(1, 3, 2);
imshow(output1);
title('0.05, 0, 255');

subplot(1, 3, 3);
imshow(medfilt2(output1, [5, 5]));
title('Mediana 5x5');

exportgraphics(gcf, 'mediana5x5-1.png', 'Resolution', 2400);

output2 = ruidoimp(image2, 0.05, 0, 255);

figure;
subplot(1, 3, 1);
imshow(image2);
title('Original');

subplot(1, 3, 2);
imshow(output2);
title('0.05, 0, 255');

subplot(1, 3, 3);
imshow(medfilt2(output2, [5, 5]));
title('Mediana 5x5');

exportgraphics(gcf, 'mediana5x5-2.png', 'Resolution', 2400);

figure;
subplot(1, 3, 1);
imshow(image1);
title('Original');

subplot(1, 3, 2);
imshow(output1);
title('0.05, 100, 200');

subplot(1, 3, 3);
imshow(medfilt2(output1, [5, 5]));
title('Mediana 5x5');

exportgraphics(gcf, 'mediana5x5-3.png', 'Resolution', 2400);

output2 = ruidoimp(image2, 0.05, 100, 200);

figure;
subplot(1, 3, 1);
imshow(image2);
title('Original');

subplot(1, 3, 2);
imshow(output2);
title('0.05, 100, 200');

subplot(1, 3, 3);
imshow(medfilt2(output2, [5, 5]));
title('Mediana 5x5');

exportgraphics(gcf, 'mediana5x5-4.png', 'Resolution', 2400);

c1 = imnoise(image1, 'salt & pepper', 0.02); % Ruido sal y pimienta
d1 = imnoise(image1, 'speckle', 0.05); % Ruido multiplicativo
e1 = imnoise(image1, 'gaussian', 0, 0.02); % Ruido blanco Gaussiano

figure;
subplot(1, 2, 1);
imshow(image1);
title('Original');

subplot(1, 2, 2);
imshow(c1);
title('Ruido sal y pimienta');

exportgraphics(gcf, 'sal-pimienta1.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(image1);
title('Original');

subplot(1, 2, 2);
imshow(d1);
title('Ruido multiplicativo');

exportgraphics(gcf, 'multiplicativo1.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(image1);
title('Original');

subplot(1, 2, 2);
imshow(e1);
title('Ruido gaussiano');

exportgraphics(gcf, 'gaussiano1.png', 'Resolution', 2400);

c2 = imnoise(image2, 'salt & pepper', 0.02); % Ruido sal y pimienta
d2 = imnoise(image2, 'speckle', 0.05); % Ruido multiplicativo
e2 = imnoise(image2, 'gaussian', 0, 0.02); % Ruido blanco Gaussiano

figure;
subplot(1, 2, 1);
imshow(image2);
title('Original');

subplot(1, 2, 2);
imshow(c2);
title('Ruido sal y pimienta');

exportgraphics(gcf, 'sal-pimienta2.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(image2);
title('Original');

subplot(1, 2, 2);
imshow(d2);
title('Ruido multiplicativo');

exportgraphics(gcf, 'multiplicativo2.png', 'Resolution', 2400);


figure;
subplot(1, 2, 1);
imshow(image2);
title('Original');

subplot(1, 2, 2);
imshow(e2);
title('Ruido gaussiano');

exportgraphics(gcf, 'gaussiano2.png', 'Resolution', 2400);

b = 7;

mask1 = [1, 1, 1; 1, 2, 1; 1, 1, 1] / 10;
mask2 = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16;
mask3 = [1, b, 1; b, b * b, b; 1, b, 1] / ((b + 2) * (b + 2));

% Image1
f11 = uint8(filter2(mask1, c1, 'valid'));
g11 = uint8(filter2(mask1, d1, 'valid'));
h11 = uint8(filter2(mask1, e1, 'valid'));

f21 = uint8(filter2(mask2, c1, 'valid'));
g21 = uint8(filter2(mask2, d1, 'valid'));
h21 = uint8(filter2(mask2, e1, 'valid'));

f31 = uint8(filter2(mask3, c1, 'valid'));
g31 = uint8(filter2(mask3, d1, 'valid'));
h31 = uint8(filter2(mask3, e1, 'valid'));

f41 = movav(c1, 7, 5);
g41 = movav(d1, 7, 5);
h41 = movav(e1, 7, 5);


% Image2
f12 = uint8(filter2(mask1, c2, 'valid'));
g12 = uint8(filter2(mask1, d2, 'valid'));
h12 = uint8(filter2(mask1, e2, 'valid'));

f22 = uint8(filter2(mask2, c2, 'valid'));
g22 = uint8(filter2(mask2, d2, 'valid'));
h22 = uint8(filter2(mask2, e2, 'valid'));

f32 = uint8(filter2(mask3, c2, 'valid'));
g32 = uint8(filter2(mask3, d2, 'valid'));
h32 = uint8(filter2(mask3, e2, 'valid'));

f42 = movav(c2, 7, 5);
g42 = movav(d2, 7, 5);
h42 = movav(e2, 7, 5);

% Ruido sal y pimienta en image1
figure;
subplot(2, 3, 1);
imshow(image1);
title('Original');

subplot(2, 3, 4);
imshow(c1);
title('Sal y pimienta');

subplot(2, 3, 2);
imshow(f11);
title('h1');

subplot(2, 3, 3);
imshow(f21);
title('h2');

subplot(2, 3, 5);
imshow(f31);
title('h3');

subplot(2, 3, 6);
imshow(f41);
title('movav');

exportgraphics(gcf, 'sal-pimienta-imagen1.png', 'Resolution', 2400);


% Ruido multiplicativo en image1
figure;
subplot(2, 3, 1);
imshow(image1);
title('Original');

subplot(2, 3, 4);
imshow(d1);
title('Multiplicativo');

subplot(2, 3, 2);
imshow(g11);
title('h1');

subplot(2, 3, 3);
imshow(g21);
title('h2');

subplot(2, 3, 5);
imshow(g31);
title('h3');

subplot(2, 3, 6);
imshow(g41);
title('movav');

exportgraphics(gcf, 'multiplicativo-imagen1.png', 'Resolution', 2400);

% Ruido Gaussiano en image1
figure;
subplot(2, 3, 1);
imshow(image1);
title('Original');

subplot(2, 3, 4);
imshow(e1);
title('Multiplicativo');

subplot(2, 3, 2);
imshow(h11);
title('h1');

subplot(2, 3, 3);
imshow(h21);
title('h2');

subplot(2, 3, 5);
imshow(h31);
title('h3');

subplot(2, 3, 6);
imshow(h41);
title('movav');

exportgraphics(gcf, 'gaussiano-imagen1.png', 'Resolution', 2400);


% Ruido sal y pimienta en image2
figure;
subplot(2, 3, 1);
imshow(image2);
title('Original');

subplot(2, 3, 4);
imshow(c2);
title('Sal y pimienta');

subplot(2, 3, 2);
imshow(f12);
title('h1');

subplot(2, 3, 3);
imshow(f22);
title('h2');

subplot(2, 3, 5);
imshow(f32);
title('h3');

subplot(2, 3, 6);
imshow(f42);
title('movav');

exportgraphics(gcf, 'sal-pimienta-imagen2.png', 'Resolution', 2400);


% Ruido multiplicativo en image2
figure;
subplot(2, 3, 1);
imshow(image2);
title('Original');

subplot(2, 3, 4);
imshow(d2);
title('Multiplicativo');

subplot(2, 3, 2);
imshow(g12);
title('h1');

subplot(2, 3, 3);
imshow(g22);
title('h2');

subplot(2, 3, 5);
imshow(g32);
title('h3');

subplot(2, 3, 6);
imshow(g42);
title('movav');

exportgraphics(gcf, 'multiplicativo-imagen2.png', 'Resolution', 2400);

% Ruido Gaussiano en image2
figure;
subplot(2, 3, 1);
imshow(image2);
title('Original');

subplot(2, 3, 4);
imshow(e2);
title('Multiplicativo');

subplot(2, 3, 2);
imshow(h12);
title('h1');

subplot(2, 3, 3);
imshow(h22);
title('h2');

subplot(2, 3, 5);
imshow(h32);
title('h3');

subplot(2, 3, 6);
imshow(h42);
title('movav');

exportgraphics(gcf, 'gaussiano-imagen2.png', 'Resolution', 2400);
