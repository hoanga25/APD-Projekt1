function inputMSP()
[fileName,path] = uigetfile({'*.wav'},'Select a audio file',...
    '.\audio');
while audioinfo(fullfile(path,fileName)).Duration<2
    fprintf("File has less than 2sec of audio (0-1 clips)\n");
    fprintf("Choose something else\n");
    [fileName,path] = uigetfile({'*.wav'},'Select a audio file',...
    '.\audio');
end
folder = convertCharsToStrings(path)+"\";
[time,sig,tc,lster]=mspPart(folder,convertCharsToStrings(fileName));
figure
tiledlayout(2,1);
nexttile
plotParam(time,sig,fileName,"Amplituda");
nexttile
plotMSP(tc,lster,"LSTER");
end