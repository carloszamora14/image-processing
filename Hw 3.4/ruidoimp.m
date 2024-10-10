function output = ruidoimp(image, prob, impMin, impMax)
    [rows, cols] = size(image);

    np = ceil(rows * cols * prob);
    output = double(image);

    for imp = 1:np
        k = ceil(rows * rand);
        l = ceil(cols * rand);

        if (mod(imp, 2) == 0)
            output(k, l) = impMin;
        else
            output(k, l) = impMax;
        end
    end

    output = uint8(output);
end
