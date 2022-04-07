folder = ".\audio\mowa_muzyka";
files = dir(fullfile(folder, '*.wav'));
for i=1:length(files)
    name = files(i).name;
    file = fullfile(folder,name);
    [sig,fs] = audioread(file);
    [frames,tf,frSamp] = generateFrames(sig,0.01,fs);
    
    names = {'time','LSTER','label',convertStringsToChars(name)};
    ste = STE(frames,frSamp);
    [tc,lster] = LSTER(ste,1);
    empty = tc*0;
    exportData(tc,lster,empty,names,"MSP",i);
end