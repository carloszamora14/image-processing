clear;
close all;

% Declaración de matrices A y B, así como de los elementos estructurantes
A = [
    0 1 1 0 1 0;
    1 1 1 0 0 1;
    1 1 0 1 0 1;
    1 1 1 0 0 0;
    0 1 1 1 0 1;
    0 0 1 0 0 0
];

B = [
  35 1 6 26 19 24;
  3 32 7 21 23 25;
  31 9 2 22 27 20;
  8 28 33 17 10 15;
  30 15 13 12 14 16;
  4 36 29 13 18 11
];

SE1 = [
    0 1 0;
    1 1 1;
    0 1 0
];

% Para definir SE2 debemos añadir elementos de relleno con valor cero para
% poder controlar el elemento que será tomado como pivote.
SE2 = [
    0, 0, 1;
    0, 1, 0;
    0, 0, 0
];

% En la función imshow se usa el array [] como argumento para indicar
% que los pixeles sean mapeados al rango [0, 255] en vez de conservar
% su valor real, así los resultados se podrán visualizar mejor.

% Figura con resultados de la dilatación y erosión de A con SE1
figure;
subplot(1, 2, 1);
imshow(imresize(imdilate(A, SE1), 40, 'nearest'));
title('A ⊕ SE1');

subplot(1, 2, 2);
imshow(imresize(imerode(A, SE1), 40, 'nearest'));
title('A ⊖ SE1');

exportgraphics(gcf, 'A-SE1.png', 'Resolution', 1200);

% Figura con resultados de la dilatación y erosión de A con SE2
figure;
subplot(1, 2, 1);
% Al utilizar la dilatación, MATLAB parece aplicar una transposición
% al elemento estructurante, por lo que debemos usar la función
% directamente con la matriz transpuesta para obtener el resultado deseado.
% Esto solo es necesario cuando usamos SE2 y no con SE1, ya que este
% último es simétrico.
imshow(imresize(imdilate(A, SE2'), 40, 'nearest'));
title('A ⊕ SE2');

subplot(1, 2, 2);
imshow(imresize(imerode(A, SE2), 40, 'nearest'));
title('A ⊖ SE2');

exportgraphics(gcf, 'A-SE2.png', 'Resolution', 1200);

% Figura con resultados de la dilatación y erosión de B con SE1
figure;
subplot(1, 2, 1);
imshow(imresize(imdilate(B, SE1), 40, 'nearest'), []);
title('B ⊕ SE1');

subplot(1, 2, 2);
imshow(imresize(imerode(B, SE1), 40, 'nearest'), []);
title('B ⊖ SE1');

exportgraphics(gcf, 'B-SE1.png', 'Resolution', 1200);

% Figura con resultados de la dilatación y erosión de B con SE2
figure;
subplot(1, 2, 1);
imshow(imresize(imdilate(B, SE2'), 40, 'nearest'), []);
title('B ⊕ SE2');

subplot(1, 2, 2);
imshow(imresize(imerode(B, SE2), 40, 'nearest'), []);
title('B ⊖ SE2');

exportgraphics(gcf, 'B-SE2.png', 'Resolution', 1200);
