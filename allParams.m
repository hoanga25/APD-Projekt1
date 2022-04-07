function allParams(file,fileName)
[sig,fs] = audioread(file);
time = (0:length(sig)-1)/fs;
[frames,tf,frSamp] = generateFrames(sig,0.01,fs);

subplot(5,2,[1 2]);
plotParam(time,sig,"Przebieg czasowy '"+fileName+"'","Amplituda");

subplot(5,2,[3 4]);
plotParam(tf,ZCR(frames,frSamp,fs),"Zero Crossing Rate","ZCR");

subplot(5,2,[5 6]);
ste = STE(frames,frSamp);
plotParam(tf,ste,"Short Time Energy","Energia");
xlabel("Czas");

subplot(5,2,7);
vol = sqrt(ste);
plotParam(tf,vol,"Głośność","Głośność");

subplot(5,2,8);
[tc,lster] = LSTER(ste,0.1);
plotParam(tc,lster,"Low Short Time Energy","LSTER");

subplot(5,2,9);
m = round(frSamp/2);
for r=1:m
    R = autocorr(frames,frSamp,r-1);
    plotParam(tf,R,"Autokorelacja","R(m)"); hold on
end
xlabel("Czas");
hold off

subplot(5,2,10);
f0 = F0(frames,frSamp);
plotParam(0:m-1,f0,"Częstotliwość podstawowa F0","Max(R(m))");
xlabel("Liczba przesunięć czasowych (m)");
