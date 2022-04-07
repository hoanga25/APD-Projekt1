female = ".\audio\gend\zdanieF.wav";
male = ".\audio\gend\zdanieM.wav";

tiledlayout(2,1);

nexttile
[sig,fs] = audioread(female);
[frames,~,frSamp] = generateFrames(sig,0.01,fs);
m = round(frSamp/2);
f0 = F0(frames,frSamp);
plotParam(0:m-1,f0,"głos damski","F0");

nexttile
[sig,fs] = audioread(male);
[frames,~,frSamp] = generateFrames(sig,0.01,fs);
m = round(frSamp/2);
f0 = F0(frames,frSamp);
plotParam(0:m-1,f0,"głos męski","F0");
xlabel("Liczba przesunięć czasowych (m)");

figure
allParams(female,"zdanieF.wav");
figure
allParams(male,"zdanieM.wav");