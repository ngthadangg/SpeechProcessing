function features = computeVowelFeature(NFFT, trains, vowels)
features = [];
for i = 1 : length(vowels)
    tempfv = 0;
    for j = 1 : length(trains)
        filePath = strcat('NguyenAmHuanLuyen-16k/', trains(j), '/', vowels(i), '.wav');
        a = char(filePath);
        [data, fs] = audioread(a);
        data = data/abs(max(data));
        data_r = silenceRemoved(data, fs);
        personFeature = computePersonVowelFeature(data_r, fs, NFFT);
        
        tempfv = tempfv + personFeature;
    end
    tempfv = tempfv/length(trains);
    features = [features, tempfv];
end
end