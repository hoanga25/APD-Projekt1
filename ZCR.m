function zcr = ZCR(frames,frSamp,fs)
fLeft = frames(1:frSamp-1,:);
fRight = frames(2:frSamp,:);
d = sign(fRight)-sign(fLeft);
zcr = fs*sum(abs(d))/(2*frSamp);
