function root = findRoot(label, labelMap)
    % Encuentra la raíz de una etiqueta usando compresión de caminos (path compression)
    while labelMap(label) ~= label
        labelMap(label) = labelMap(labelMap(label)); % Compresión de caminos
        label = labelMap(label);
    end
    root = label;
end
