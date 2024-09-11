function outputImage = resizeImage(height, width, image)
    if ndims(image) < 2
        error('Invalid image.');
    end

    imageHeight = size(image, 1);
    imageWidth = size(image, 2);

    if height > imageHeight || width > imageWidth
        error('The image cannot be resized.');
    end

    upperLeftX = max(1, fix((imageWidth - width) / 2));
    upperLeftY = max(1, fix((imageHeight - height) / 2));

    outputImage = imcrop( ...
        image, ...
        [upperLeftX, upperLeftY, width - 1, height - 1] ...
    );
end
