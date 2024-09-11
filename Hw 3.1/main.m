clear all
clc
close all

image1 = imread('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUGFil5WQItk9HKF1rcn3H31Q8t-klKCBrsplHCDgPTGds-0OcQlupfXzc9yVg1FkQpg&usqp=CAU');
image2 = imread('https://www.assemblyai.com/blog/content/images/2022/07/How-Imagen-Actually-Works.png');
image3 = imread('https://imagenes.elpais.com/resizer/v2/AME5RLHJOI7AVFKTU5HEP5HS6Q.jpg?auth=c7c89fbf6ad245e203353cb6e1580b89abacae273556e95c8c55b6dc5ef01da9&width=1960&height=1103&smart=true');

resizedImage1 = interpolateImage(image1, 1000, 1000);
resizedImage2 = interpolateImage(image2, 600, 1000);
resizedImage3 = interpolateImage(image3, 500, 900);

figure;
subplot(1, 2, 1); imshow(image1); title('Antes de interpolar'); axis([0, 1000, 0, 1000]); axis on;
subplot(1, 2, 2); imshow(resizedImage1); title('Después de interpolar'); axis([0, 1000, 0, 1000]); axis on;
exportgraphics(gcf, 'result1.png', 'Resolution', 1200);

figure;
subplot(1, 2, 1); imshow(image2); title('Antes de interpolar'); axis([0, 1600, 0, 900]); axis on;
subplot(1, 2, 2); imshow(resizedImage2); title('Después de interpolar'); axis([0, 1600, 0, 900]); axis on;
exportgraphics(gcf, 'result2.png', 'Resolution', 1200);

figure;
subplot(1, 2, 1); imshow(image3); title('Antes de interpolar'); axis([0, 1960, 0, 1103]); axis on;
subplot(1, 2, 2); imshow(resizedImage3); title('Después de interpolar'); axis([0, 1960, 0, 1103]); axis on;
exportgraphics(gcf, 'result3.png', 'Resolution', 1200);
