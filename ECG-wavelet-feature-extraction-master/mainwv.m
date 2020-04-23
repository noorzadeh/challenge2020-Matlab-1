function [beatrate,cleanecg]=mainwv(ecg)

t=(0:length(ecg)-1)/500;
tmax = max(t);

sr=numel(ecg)/max(tmax);
srate=['sampeling rate is ' num2str(sr)];
%disp(srate)
rt=['recording_time=' num2str(tmax) 'sec'];
%disp(rt)
[c,l,d1,d2,d3,d4,d5,d6,d7,d8,cleanecg]=wavelettransform(ecg);% wavelet transform and noise removal
threshold=thresholdcalc(cleanecg);% caclulate threshold for R wave
[rsquared]=rdetect(c,l,d3,d4,d5,cleanecg);% detect and square R wave
[beatrate,beatduration,srate,ra]=findbeatrate(rsquared,threshold,tmax);% find beat rate using rpeak and threshold
%plotecg(ecg,ra,beatrate,srate,t);% plot the orignal signal and detected r-peak
end
