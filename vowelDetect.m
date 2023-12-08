function index = vowelDetect(personFeatureVector, featureVector)
    distances = zeros(1, 5);  % Initialize distances array with zeros
    index = 1; 
    for i = 1 : 5
        distances(i) = EuclideanDistance(personFeatureVector, featureVector(:, i));
    end
    [~, index] = min(distances);  % Find the index of the minimum distance
end
