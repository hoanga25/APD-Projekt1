folder = ".\audio\mowa_muzyka\";
files = ["budzik1.wav" "budzik2.wav" "pobudka.wav" "wstajemy.wav"];
cmfile = "czas_wstawać.wav";

i=1;
[time,sig,tc,lster]=mspPart(folder,files(i));
subplot(6,2,1)
plotParam(time,sig,files(i),"Amplituda");
subplot(6,2,3)
plotMSP(tc,lster,"LSTER");
i=i+1;

[time,sig,tc,lster]=mspPart(folder,files(i));
subplot(6,2,5)
plotParam(time,sig,files(i),"Amplituda");
subplot(6,2,7)
plotMSP(tc,lster,"LSTER");
i=i+1;

[time,sig,tc,lster]=mspPart(folder,files(i));
subplot(6,2,2)
plotParam(time,sig,files(i),"Amplituda");
subplot(6,2,4)
plotMSP(tc,lster,"LSTER");
i=i+1;

[time,sig,tc,lster]=mspPart(folder,files(i));
subplot(6,2,6)
plotParam(time,sig,files(i),"Amplituda");
subplot(6,2,8)
plotMSP(tc,lster,"LSTER");
i=i+1;

[time,sig,tc,lster]=mspPart(folder,cmfile);
subplot(6,2,[9 10])
plotParam(time,sig,cmfile,"Amplituda");
subplot(6,2,[11 12])
plotMSP(tc,lster,"LSTER");