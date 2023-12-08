function [Result,cMatrix] = confusionMatrix(NFFT, testers, vowels, features)
cMatrix = zeros(5,5);
Result = cell(length(testers),length(vowels));
for i = 1 : length(vowels)
    for j = 1 : length(testers)
        
        filePath = strcat('NguyenAmKiemThu-16k/', testers(j), '/', vowels(i), '.wav');
        a = char(filePath);
        [data, fs] = audioread(a);
        data = data/abs(max(data));
        data_r = silenceRemoved(data,fs);
        % vecto ??c tr?ng c?a nguyên âm ??u vào
        personFeature = computePersonVowelFeature(data_r,fs,NFFT);
        % d? ?oán nhãn
        index = vowelDetect(personFeature, features);
        
        % C?p nh?t ma tr?n nh?m l?n
        cMatrix(i, index) = cMatrix(i, index) + 1;

        % Ket qua nhan dang
        if index == i
            kq = 'Dung';
        else 
            kq = 'Sai';
        end
        Result{j,i} = strcat(testers(j), '/', vowels(i), '.wav -> /',vowels(index),'/, ',kq );

    end
end
end