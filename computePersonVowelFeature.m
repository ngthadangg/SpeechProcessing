function personFeature = computePersonVowelFeature(data_r,fs,NFFT)
personFeature = 0;
start = floor(length(data_r)/3);
en = 2*start;
f_d = 0.02;%0.02-0.04s
f_shift = round(0.01*fs);%0.01-0.015s
f_size = round(f_d * fs);
M = 0;
for i = start:f_shift:en
    frame_signal = data_r(i:i+f_size);
    frame_w = hann(length(frame_signal)).*frame_signal';
    frame_spectrum = abs(fft(frame_w, NFFT));
    frame_spectrum = frame_spectrum(1:length(frame_spectrum)/2);
    personFeature = personFeature + frame_spectrum;
    M=M+1;
end
personFeature = personFeature/M;
end