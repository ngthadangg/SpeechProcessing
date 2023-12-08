figure(1);
subplot(5,1,1); plot(features(:,1:13)', 'color', 'b'); title('a');
subplot(5,1,2); plot(features(:,14:26)', 'color', 'b'); title('e');
subplot(5,1,3); plot(features(:,27:39)', 'color', 'b'); title('i');
subplot(5,1,4); plot(features(:,40:52)', 'color', 'b');  title('o');
subplot(5,1,5); plot(features(:,53:65)', 'color', 'b');  title('u');

figure(2);
hold on;
h1 = plot(features(:,1:13)', 'color', 'b');
h2 = plot(features(:,14:26)', 'color', 'r');
h3 = plot(features(:,27:39)', 'color', 'g');
h4 = plot(features(:,40:52)', 'color', 'y');
h5 = plot(features(:,53:65)', 'color', 'k');
hold off;
legend([h1(1), h2(1), h3(1), h4(1), h5(1)], 'a', 'e', 'i', 'o', 'u');

f = figure(3);
uit = uitable(f, 'Data', cMatrix);
uit.ColumnName = {'a', 'e', 'i', 'o', 'u'};
uit.RowName = {'a', 'e', 'i', 'o', 'u'};
uit.ColumnWidth = {93, 93, 93, 93, 93};
uit.Position = [100, 200, 500, 150]; 


fig = figure;
axis off;
charCellArray = cellfun(@char, Result, 'UniformOutput', false);
uitable('Data', charCellArray, 'Position', [300, 300, 1200, 520], 'ColumnWidth', {200,200,200,200,200});
title('Bang ket qua nhan dang');
