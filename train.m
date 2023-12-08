clear; close all;

trains = {
    '23MTL', '24FTL', '25MLM', '27MCM', '28MVN', '29MHN', '30FTN', ...
    '32MTP', '33MHP', '34MQP', '35MMQ', '36MAQ', '37MDS', '38MDS', ...
    '39MTS', '40MHS', '41MVS', '42FQT', '43MNT', '44MTT', '45MDV'
    };


vowels = {'a', 'e', 'i', 'o', 'u'};

NFFT = 1024;

features = computeVowelFeature(NFFT, trains, vowels);




