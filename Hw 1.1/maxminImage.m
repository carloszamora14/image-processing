function [Vmax, Vmin] = maxminImage(B)
    Vmax = max(max(B));
    Vmin = min(min(B));
end
