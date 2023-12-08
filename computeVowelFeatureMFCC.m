function features = computeVowelFeatureMFCC(N_MFCC, trains, vowels, K)

features = [];

for i = 1 : length(vowels)
    tempfv = [];
    for j = 1 : length(trains)
        filePath = strcat('NguyenAmHuanLuyen-16k/', trains(j), '/', vowels(i), '.wav');
        a = char(filePath);
        [data, fs] = audioread(a);
        data = data/abs(max(data));
        data_r = silenceRemoved(data, fs);
        personFeature = computePersonVowelFeatureMFCC(data_r, fs, N_MFCC);
        
        tempfv = [tempfv,personFeature'];
        
    end
    kVector = v_kmeans(tempfv', K);
    
    features = [features, kVector];
end
end