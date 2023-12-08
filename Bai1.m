 clear; close all;

speakers = {'27MCM','34MQP','44MTT','37MDS'};

vowels = {'a', 'e', 'i', 'o', 'u'};


for i = 1 : length(speakers)
    figure('Name',char(strcat('Spectrogram - ',speakers(i))));
    for j = 1 : length(vowels)
        filePath = strcat('NguyenAmHuanLuyen-16k/', speakers(i), '/', vowels(j), '.wav');
        [x, fs] = audioread(char(filePath));
      
        x_normalized_large = x / max(abs(x));
        
        subplot(5,1,j); colormap parula; spectrogram(x_normalized_large,5*10^(-3)*fs, 2*10^(-3)*fs, 1028, fs, 'yaxis'); 
   
        title(strcat('/', strcat(vowels(j),'/')));
    end
    
end

