clear
close all

% image = imread('https://www.kukyflor.com/blog/wp-content/uploads/2018/04/Keukenhof.original.6040.jpg');
image = imread('https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg?cs=srgb&dl=pexels-souvenirpixels-1619317.jpg&fm=jpg');
% image = imread('https://www.pixelstalk.net/wp-content/uploads/image10/Tranquil-pond-surrounded-by-reeds-dragonflies-soft-evening-light-Nature-Wallpaper.jpg');
% image = rgb2gray(image);

imagenFinalR = ecualizarImagen(image(:, :, 1), 255);
imagenFinalG = ecualizarImagen(image(:, :, 2), 255);
imagenFinalB = ecualizarImagen(image(:, :, 3), 255);
imagenFinal = cat(3, imagenFinalR, imagenFinalG, imagenFinalB);

mostrarHistogramas(image, imagenFinal, 'rgb-ecualizado.png');

imagenYCbCr = rgb2ycbcr(image);
imagenY = ecualizarImagen(imagenYCbCr(:, :, 1), 255);
imagenCb = ecualizarImagen(imagenYCbCr(:, :, 2), 255);
imagenCr = ecualizarImagen(imagenYCbCr(:, :, 3), 255);

imagen1 = cat(3, imagenY, imagenCb, imagenCr);
imagen1rbg = ycbcr2rgb(imagen1);
mostrarHistogramas(image, imagen1rbg, 'ycbcr.png');

imagen2 = cat(3, imagenYCbCr(:, :, 1), imagenCb, imagenCr);
imagen2rbg = ycbcr2rgb(imagen2);
mostrarHistogramas(image, imagen2rbg, 'y.png');

imagen3 = cat(3, imagenY, imagenYCbCr(:, :, 2), imagenYCbCr(:, :, 3));
imagen3rbg = ycbcr2rgb(imagen3);
mostrarHistogramas(image, imagen3rbg, 'cbcr.png');
