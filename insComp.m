files = ["drums.wav" "klav.wav" "melody.wav"];
folder = ".\audio\";
tiledlayout(3,1);
for i=1:length(files)
    nexttile
    [sig,fs] = audioread(folder+files(i));
    [frames,~,frSamp] = generateFrames(sig,0.01,fs);
    m = round(frSamp/2);
    f0 = F0(frames,frSamp);
    plotParam(0:m-1,f0,files(i),"F0");
end

figure
allParams(folder+files(1),files(1));

figure
allParams(folder+files(2),files(2));

figure
allParams(folder+files(3),files(3));
