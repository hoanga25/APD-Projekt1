function [tc,lster] = LSTER(ste,clDur)
[clSTE,tc,clFram] = generateFrames(ste,clDur,1/0.01);
avSTE = mean(clSTE);
lster = sum(1+sign(avSTE/2 - clSTE))/clFram;
