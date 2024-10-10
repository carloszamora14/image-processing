function outputImg = movav(img, windowWidth, windowHeight)
    h = ones(windowHeight, windowWidth) / (windowWidth * windowHeight);
    outputImg = filter2(h, img, "valid");
end
