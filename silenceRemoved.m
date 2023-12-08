function data_r = silenceRemoved(data, fs)
f_d = 0.025;
frames = framing(data, fs, f_d);% it is like 0% overlap with rectangular window

[r,~] = size(frames);
ste = 0;
for i = 1 : r
    ste(i) = sum(frames(i,:).^2);
end
ste = ste./max(ste); %normalize the data
% Silence Removal
id = find(ste >= 0.01);
fr_ws = frames(id,:); % frames without silence
% reconstruct signal
data_r = reshape(fr_ws',1,[]);
end