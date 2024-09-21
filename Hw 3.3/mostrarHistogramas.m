function mostrarHistogramas(imagenOriginal, imagenFinal, nombre)
    figure;
    subplot(2, 2, 1);
    imshow(imagenOriginal);
    title('Imagen original');

    subplot(2, 2, 2);
    imshow(imagenFinal);
    title('Imagen ecualizada');

    subplot(2, 2, 3);
    histogram(imagenOriginal(:, :, 1), 'BinMethod', 'integers', 'FaceColor', 'r', 'EdgeAlpha', 0, 'FaceAlpha', 1);
    hold on;
    histogram(imagenOriginal(:, :, 2), 'BinMethod', 'integers', 'FaceColor', 'g', 'EdgeAlpha', 0, 'FaceAlpha', 0.7);
    histogram(imagenOriginal(:, :, 3), 'BinMethod', 'integers', 'FaceColor', 'b', 'EdgeAlpha', 0, 'FaceAlpha', 0.7);
    xlabel('Valor RGB');
    ylabel('Frequencia');
    title('Hist RGB');
    xlim([0 257]);

    subplot(2,2,4)
    histogram(imagenFinal(:, :, 1), 'BinMethod', 'integers', 'FaceColor', 'r', 'EdgeAlpha', 0, 'FaceAlpha', 1);
    hold on;
    histogram(imagenFinal(:, :, 2), 'BinMethod', 'integers', 'FaceColor', 'g', 'EdgeAlpha', 0, 'FaceAlpha', 0.7);
    histogram(imagenFinal(:, :, 3), 'BinMethod', 'integers', 'FaceColor', 'b', 'EdgeAlpha', 0, 'FaceAlpha', 0.7);
    xlabel('Valor RGB');
    ylabel('Frequencia');
    title('Hist RGB Ec');
    xlim([0 257]);

    exportgraphics(gcf, nombre, 'Resolution', 3200);
end
