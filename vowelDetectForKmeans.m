function index = vowelDetectForKmeans(personFeatureVector, featureVector, K)
distances = zeros(K, 5);
index = 1;
for i = 1 : 5
    for j = 1:K
        for x = 1:K
            distances(j ,i) = EuclideanDistance(personFeatureVector(x,:), featureVector(j, (i-1)*13+1:i*13));
        end
    end
end
[~, minIndex] = min(distances(:));
[~, index] = ind2sub(size(distances), minIndex);
end
