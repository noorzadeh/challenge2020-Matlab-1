function [features]=get_features(data, header_data)
addpath(genpath('ECG-wavelet-feature-extraction-master'));
ttline  = header_data(16);
tmp     = strsplit(ttline{1},': ');
tmp_c   = strsplit(tmp{2},',');
%label   = ismember(classes,tmp_c);

for k=1:12
    [beatrate,cleanecg] = mainwv(data(k,:)');
    features(k) = beatrate;
    %ECG_PQRST_Revised(data(k,:)');
    fftecg=fft(cleanecg);
    [famp, fval]=max (abs(fftecg));
    fval = (fval/length(fftecg))*500;
    features(k+12) = fval;

end

flabel = {'br1','br2','br3','br4','br5','br6','br7','br8','br9', ...
'br10','br11','br12','fmax1','fmax2','fmax3','fmax4','fmax5', ...
'fmax6','fmax7','fmax8','fmax9','fmax10','fmax11','fmax12'};
