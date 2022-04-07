function [frames,time,frSamp] = generateFrames(signal,frDur,fs)
% Function dividing audio signal into frames of a given duration 
% [10ms,40ms] and overlap starting aproximately in the frame center
% 
% ARGS:
% signal - sampled audio amplitudes
% frDur - desired frame duration
% fs - sample rate
%
% RETURN:
% frames - frSamp x frNum matrix, horizontal vector of frames(that are 
% vertical vectors of samples)
% time - vector of timestamps for each frame
% frSamp - samples per frame
% frNum - total number of frames

sDur = 1/fs;
frSamp = round(frDur*fs);
ovSamp = 0;
shSamp = frSamp;
% ovSamp = floor(frSamp/2);
% shSamp = ceil(frSamp/2);

[frames,~] = buffer(signal,frSamp,ovSamp,'nodelay');
frNum = size(frames,2);
frCent = frSamp/2; % frame center in samples
time = (frCent:shSamp:frCent+(frNum-1)*shSamp)*sDur;

end