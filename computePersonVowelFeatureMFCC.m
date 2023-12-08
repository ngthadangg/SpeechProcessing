function personFeature = computePersonVowelFeatureMFCC(data_r,fs,N_MFCC)
start = floor(length(data_r)/3);
en = 2*start;
f_d = 0.02;%0.02-0.04
f_size = round(f_d*fs);
f_shift = round(0.01*fs);%0.01-0.015
stableData = data_r(start:en);
mfcc_vector = v_melcepst(stableData, fs, 'M', N_MFCC, floor(3*log(fs)), f_size, f_shift);
personFeature = mfcc_vector;
end