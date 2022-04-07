words = ["sześć" "oga"]; 
folder = ".\audio\speaker";
speakers = ["A" "C"];
files = folder+speakers+"\"+words;

tiledlayout(2*length(files),1)
for i=1:length(files)
    file = files(i)+".wav";
    [sig,fs] = audioread(file);
    [frames,tf,frSamp] = generateFrames(sig,0.01,fs);
    plotSUV(tf,ZCR(frames,frSamp,fs),STE(frames,frSamp),words(i));
end