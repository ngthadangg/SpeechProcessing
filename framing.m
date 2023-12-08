function [frames] = framing(x,fs,f_d)
f_size = round(f_d * fs);  % frame size
l_s = length(x);    % speech length
n_f = floor(l_s/f_size); % no. of frames
temp = 0;
for i = 1 : n_f
    frames(i,:) = x(temp + 1 : temp + f_size);
    temp = temp + f_size;
end

end