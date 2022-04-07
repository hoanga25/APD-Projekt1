function inputFileParams ()
[fileName,path] = uigetfile({'*.wav'},'Select a audio file','.\audio');
file = fullfile(path,fileName);
allParams(file,fileName);