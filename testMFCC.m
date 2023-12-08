testers = {'01MDA', '02FVA', '03MAB', '04MHB', '05MVB', '06FTB', '07FTC', ...
    '08MLD', '09MPD', '10MSD', '11MVD', '12FTD', '14FHH', '15MMH', ...
    '16FTH', '17MTH', '18MNK', '19MXK', '20MVK', '21MTL', '22MHL'
    };
[Result,cMatrix] = confusionMatrixMFCC(N_MFCC, testers, vowels, features, K);

numHit = 0;
numFiles = 5*length(testers);



for i = 1 : 5
    numHit = numHit + cMatrix(i,i);
end
hit_rate = numHit / numFiles;
disp(hit_rate*100);
