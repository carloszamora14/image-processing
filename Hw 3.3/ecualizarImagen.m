function output = ecualizarImagen(imagen, intensidadMax)
    if (intensidadMax < 0 || intensidadMax > 255)
        error('Intensidad fuera del rango válido');
    end

    if (~ismatrix(imagen))
        error('Imagen debe estar en escala de grises');
    end

    frecuencias = imhist(imagen);
    [r, c] = size(imagen);

    probabilidades = double(frecuencias) / (r * c);

    frecuenciasAcumuladas = probabilidades;
    for i = 2:256
        frecuenciasAcumuladas(i) = probabilidades(i) + frecuenciasAcumuladas(i - 1);
    end

    resultados = round(frecuenciasAcumuladas * intensidadMax);

    output = imagen;
    for i = 1:r
        for j = 1:c
            intensidad = imagen(i, j);
            output(i, j) = resultados(intensidad + 1);
        end
    end
end
