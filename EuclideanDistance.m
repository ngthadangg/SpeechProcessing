function distance = EuclideanDistance(point1, point2)
    if numel(point1) ~= numel(point2)
        error('not same size');
    end
    distance = sqrt(sum((point1 - point2).^2));
end
