train;
% read sound 

[data, fs] = audioread('NguyenAmKiemThu-16k/19MXK/a.wav');
% normalize data
data = data / abs(max(data));

% do framing
f_d = 0.02;
frames = framing(data, fs, f_d);% it is like 0% overlap with rectangular window

% calculate frames energy
[r,c] = size(frames);
ste = 0;
for i = 1 : r
    ste(i) = sum(frames(i,:).^2);    
end

ste = ste./max(ste); %normalize the data

f_size = round(f_d * fs);
ste_wave = 0;
for j = 1 : length(ste)
    l = length(ste_wave);
    ste_wave(l : l + f_size) = ste(j);
end

% plot the STE with Signal
t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);
t1 = [0 : 1/fs : length(ste_wave)/fs];
t1 = t1(1:end - 1);
% Silence Removal
id = find(ste >= 0.01);
fr_ws = frames(id,:); % frames without silence
data_r = reshape(fr_ws',1,[]);
data_r_1p3 = floor(length(data_r)/3);
% Determine stable vowel speech 
x_positions = [data_r_1p3, data_r_1p3*2];
y_limits = ylim;  
data_r_stable = data_r(data_r_1p3:data_r_1p3*2);
%%%%%%%
dtsfft = computePersonVowelFeature(data_r_stable,fs,1024);

disp(EuclideanDistance(dtsfft,features(:,1)));
disp(EuclideanDistance(dtsfft,features(:,2)));
disp(EuclideanDistance(dtsfft,features(:,3)));
disp(EuclideanDistance(dtsfft,features(:,4)));
disp(EuclideanDistance(dtsfft,features(:,5)));