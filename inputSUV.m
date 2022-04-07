function inputSUV()
[fileName,path] = uigetfile({'*.wav'},'Select a audio file','.\audio');
file = fullfile(path,fileName);
[sig,fs] = audioread(file);
[frames,tf,frSamp] = generateFrames(sig,0.01,fs);
zcr = ZCR(frames,frSamp,fs);
ste = STE(frames,frSamp);
tiledlayout(2,1);
plotSUV(tf,zcr,ste,fileName);