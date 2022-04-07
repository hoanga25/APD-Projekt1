function [time,sig,tc,lster]=mspPart(folder,file)
[sig,fs] = audioread(folder+file);
time = (0:length(sig)-1)/fs;
[frames,~,frSamp] = generateFrames(sig,0.01,fs);
ste = STE(frames,frSamp);
[tc,lster] = LSTER(ste,1);