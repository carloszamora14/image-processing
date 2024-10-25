close all;
clear;

% Lectura de la imagen en blanco y negro
I = imread('https://www.pipeaway.com/wp-content/uploads/2023/11/plakidas-bridge-zagori-ivan-kralj-photo-by-nikos-samartzis-1170x600.jpg');

% Obtenemos las dimensiones de la imagen
[r, c, d] = size(I);

% Para asegurar trabajar en escala de grises, si la imagen tiene más de un canal se convierte a escala de grises
if d > 1
    I = rgb2gray(I);
end

% Se transforma la imagen a double para cálculos más precisos
I = double(I);

% Selector de tipo de filtro con varias opciones
% Para cada opción se tienen parámetros específicos
f = input('Introduce el filtro deseado: 1-Motion, 2-Average, 3-Disk, 4-Gaussian, 5-Laplaciano, 6-Prewitt(H), 7-Prewitt(V), 8-Sobel(H) y 9-Sobel(V): ');

if f == 1
    l = input('Introduce la longitud de FM: ');
    th = input('Introduce el ángulo de FM: ');
    h = fspecial('motion', l, th); % len y theta
elseif f == 2
    l = input('Introduce el tamaño de FA: ');
    h = fspecial('average', l); % hsize
elseif f == 3
    ra = input('Introduce el radio de FD: ');
    h = fspecial('disk', ra); % radius
elseif f == 4
    l = input('Introduce el tamaño de FG: ');
    s = input('Introduce sigma (0-1) de FG: ');
    h = fspecial('gaussian', l, s); % hsize, sigma
elseif f == 5
    a = input('Introduce alpha (0-1) de FL: ');
    h = fspecial('laplacian', a); % alpha
elseif f == 6
    h = fspecial('prewitt'); % Filtro Prewitt Horizontal
elseif f == 7
    h = fspecial('prewitt');
    h = h'; % Filtro Prewitt Vertical (transpuesta)
elseif f == 8
    h = fspecial('sobel'); % Filtro Sobel Horizontal
elseif f == 9
    h = fspecial('sobel');
    h = h'; % Filtro Sobel Vertical (transpuesta)
end

% Se aplica la transformada de Fourier a la imagen
If = fftshift(fft2(I));

% Se usa la transformada de Fourier en el filtro con el tamaño de la imagen
H = fft2(h, r, c);

% Se reordena el filtro con fftshift
H = fftshift(H);

% Multiplicación punto a punto de la imagen y el filtro en el dominio de Fourier
Ifc = If .* H;

% Se aplica la inversa de la transformada de Fourier y se extraen los valores reales
Ift = real(ifft2(fftshift(Ifc)));

% Se muestran la imagen original y la filtrada
figure, imshow([I, uint8(Ift)]);
title('Imagen Original y Filtrada');

% Se muestran los logaritmos del espectro de amplitud de la imagen, el filtro y la imagen filtrada
figure,
subplot(1, 3, 1), imshow(log(abs(If) + 1), []), title('log(EA) de la Imagen');
subplot(1, 3, 2), imshow(log(abs(H) + 1), []), title('log(EA) de H');
subplot(1, 3, 3), imshow(log(abs(Ifc) + 1), []), title('log(EA) Imagen Degradada');

% Se muestran las mallas (mesh) del espectro de amplitud de la imagen, el filtro y la imagen degradada
figure,
subplot(3, 1, 1), colormap hsv, mesh(log(abs(If) + 1)), title('EA de Imagen Original');
subplot(3, 1, 2), colormap hsv, mesh(abs(H)), title('EA de H');
subplot(3, 1, 3), colormap hsv, mesh(log(abs(Ifc) + 1)), title('EA de Imagen Degradada');
