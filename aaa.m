file = 'NguyenAmKiemThu-16k\18MNK\a.wav';
[data, fs] = audioread(file);
data = data/abs(max(data));
data_r = silenceRemoved(data,fs);
personFeature = computePersonVowelFeatureMFCC(data_r,fs,13);
plot(personFeature');
plot(v_kmeans(personFeature, 2)');
%{
trains = {
    '23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', ...
    '32MTP', '33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', ...
    '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'
    };
vowels = {'a', 'e', 'i', 'o', 'u'};
features = [];

for i = 1 : length(vowels)
    tempfv = [];
    for j = 1 : length(trains)
        filePath = strcat('NguyenAmHuanLuyen-16k\', trains(j), '\', 'a', '.wav');
        a = char(filePath);
        [data, fs] = audioread(a);
        data = data/abs(max(data));
        data_r = silenceRemoved(data, fs);
        personFeature = computePersonVowelFeatureMFCC(data_r, fs, 13);
        
        tempfv = [tempfv,personFeature'];
        
    end
    kVector = v_kmeans(tempfv', 2);
    
    features = [features, kVector];
end
plot(v_kmeans(tempfv', 2)');
%}