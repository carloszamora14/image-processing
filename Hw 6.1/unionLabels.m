function label_map = unionLabels(label1, label2, labelMap)
    % Une dos conjuntos al hacer que la raíz de uno apunte a la raíz del otro
    root1 = findRoot(label1, labelMap);
    root2 = findRoot(label2, labelMap);

    if root1 ~= root2
        labelMap(root2) = root1; % Union simple
    end
end
