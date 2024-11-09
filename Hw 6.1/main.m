clear;
close all;

img = imread('https://i.pinimg.com/736x/f3/61/aa/f361aa64ff23db8a0d1138c050a10c34.jpg');
imgBin = imbinarize(img);
imgBin = ~imgBin;

[rows, cols] = size(imgBin);

% Inicializa la matriz de etiquetas
labels = zeros(rows, cols);

% Inicia la primera etiqueta
currentLabel = 1;

% Lista para almacenar equivalencias
equivalences = {};

for r = 1:rows
    for c = 1:cols
        if imgBin(r, c) == 1
            left = 0;
            top = 0;

            if c > 1
                left = labels(r, c - 1);
            end
            if r > 1
                top = labels(r - 1, c);
            end

            if left == 0 && top == 0
                % Caso 1: Ningún vecino tiene etiqueta
                labels(r, c) = currentLabel;
                currentLabel = currentLabel + 1;
            elseif left ~= 0 && top == 0
                % Caso 2: Solo el vecino izquierdo tiene etiqueta
                labels(r, c) = left;
            elseif left == 0 && top ~= 0
                % Caso 2: Solo el vecino superior tiene etiqueta
                labels(r, c) = top;
            elseif left ~= 0 && top ~= 0
                if left == top
                    % Caso 3: Ambos vecinos tienen la misma etiqueta
                    labels(r, c) = left;
                else
                    % Caso 4: Vecinos tienen etiquetas diferentes
                    labels(r, c) = min(left, top);
                    equivalences{end + 1} = [left, top];
                end
            end
        end
    end
end

% Inicializar cada etiqueta en su propio conjunto
labelMap = 1:(currentLabel - 1);

% Aplicar Union-Find en las equivalencias
for i = 1:length(equivalences)
    labelMap = unionLabels(equivalences{i}(1), equivalences{i}(2), labelMap);
end

% Actualizar todas las etiquetas de acuerdo con sus raíces
for r = 1:rows
    for c = 1:cols
        if labels(r, c) > 0
            labels(r, c) = findRoot(labels(r, c), labelMap);
        end
    end
end

labels = labels * 10;  % Escala las etiquetas para aumentar la variación de color
imagesc(labels);
colormap(jet);
colorbar;
title('Componentes Conexas Etiquetadas');
