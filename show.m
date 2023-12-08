figure('Name', 'Vector FFT voi NFFT =  512');
 
subplot(5,1,1); plot(features(:,1)); title('a');
subplot(5,1,2); plot(features(:,2)); title('e');
subplot(5,1,3); plot(features(:,3)); title('i');
subplot(5,1,4); plot(features(:,4)); title('o');
subplot(5,1,5); plot(features(:,5)); title('u');

figure('Name', 'Vector dac trung');
hold on;
plot(features(:,1));
plot(features(:,2));
plot(features(:,3));
plot(features(:,4));
plot(features(:,5));
hold off;
legend('a', 'e', 'i', 'o', 'u');

f = figure('Name', 'Ma tran nham lan');
uit = uitable(f, 'Data', cMatrix);
uit.ColumnName = {'a', 'e', 'i', 'o', 'u'};
uit.RowName = {'a', 'e', 'i', 'o', 'u'};
uit.ColumnWidth = {93, 93, 93, 93, 93}; % Adjusted column width
uit.Position = [100, 200, 500, 150]; % Adjusted position and size



fig = figure('Name','Bang ket qua nhan dang');
axis off;
charCellArray = cellfun(@char, Result, 'UniformOutput', false);
uitable('Data', charCellArray, 'Position', [300, 300, 1200, 520], 'ColumnWidth', {200,200,200,200,200});
title('Bang ket qua nhan dang');

