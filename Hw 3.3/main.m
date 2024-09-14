clear
close all

image = imread('https://www.pixelstalk.net/wp-content/uploads/image10/Tranquil-pond-surrounded-by-reeds-dragonflies-soft-evening-light-Nature-Wallpaper.jpg');
image = rgb2gray(image);

frecuencias = imhist(image);
[r, c] = size(image);
probabilidades = double(frecuencias) / (r * c);

% frecuenciasAcumuladas = cumsum(probabilidades);
frecuenciasAcumuladas = probabilidades;
for i = 2:256
    frecuenciasAcumuladas(i, 1) = frecuenciasAcumuladas(i, 1) + frecuenciasAcumuladas(i - 1, 1);
end

resultados = round(frecuenciasAcumuladas * (256 - 1));

imagenFinal = image;
for i = 1:r
    for j = 1:c
        intensidad = image(i, j);
        imagenFinal(i, j) = resultados(intensidad + 1, 1);
    end
end

figure;
subplot(1, 2, 1);
imshow(image);

subplot(1, 2, 2);
imshow(imagenFinal);

exportgraphics(gcf, 'cambioFrecuencias.png', 'Resolution', 2400);
