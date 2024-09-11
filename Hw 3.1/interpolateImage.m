function resizedImage = interpolateImage(image, newRows, newCols)
    ratioRows = newRows / size(image, 1);
    ratioCols = newCols / size(image, 2);

    interpolatedRowIndices = ceil([1:newRows] / ratioRows);
    interpolatedColIndices = ceil([1:newCols] / ratioCols);

    resizedImage = image(interpolatedRowIndices, interpolatedColIndices, :);
end
