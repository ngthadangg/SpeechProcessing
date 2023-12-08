function [Result,cMatrix] = confusionMatrixMFCC(N_MFCC, testers, vowels, features, K)
cMatrix = zeros(5,5);
Result = cell(length(testers),length(vowels));
for i = 1 : length(vowels)
    for j = 1 : length(testers)
       filePath = strcat('NguyenAmKiemThu-16k/', testers(j), '/', vowels(i), '.wav');
        a = char(filePath);
        [data, fs] = audioread(a);
        data = data/abs(max(data));
        data_r = silenceRemoved(data,fs);
        personFeature = v_kmeans(computePersonVowelFeatureMFCC(data_r,fs,N_MFCC),K);
        index = vowelDetectForKmeans(personFeature, features, K);
        cMatrix(i, index) = cMatrix(i, index) + 1;

        if index == i
            kq = 'Dung';
        else 
            kq = 'Sai';
        end
        Result{j,i} = strcat(testers(j), '/', vowels(i), '.wav -> /',vowels(index),'/, ',kq );

    end
end
end