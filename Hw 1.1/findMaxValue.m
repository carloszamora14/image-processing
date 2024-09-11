function maxVal = findMaxValue(val1, val2, val3)
    if (val1 >= val2 && val1 >= val3)
        maxVal = val1;
    elseif (val2 >= val3)
        maxVal = val2;
    else
        maxVal = val3;
    end
end
