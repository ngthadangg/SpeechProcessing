tic;
start_time_silence_removal = toc;
testMFCC;
end_time = toc;
time_silence_removal = end_time - start_time_silence_removal;
fprintf(num2str(time_silence_removal));

