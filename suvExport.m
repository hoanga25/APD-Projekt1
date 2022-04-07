words = ["sześć" "pies" "oga" "jeden"]; 
folder = ".\audio\speaker";
speakers = ["A" "B" "C" "D"];
files = folder+speakers+"\"+words;
for i=1:length(files)
    file = files(i)+".wav";
    labelName = "label "+words(i)+speakers(i);
    [sig,fs] = audioread(file);
    [frames,tf,frSamp] = generateFrames(sig,0.01,fs);
    names = {'time' 'STE','ZCR',convertStringsToChars(labelName)};
    exportData(tf,STE(frames,frSamp),ZCR(frames,frSamp,fs),names,"SUV",i);
end