function R = autocorr(frames,frSamp,r)
fLeft = frames(1:frSamp-r,:);
fRight = frames(1+r:frSamp,:);
mult = sum(fLeft.*fRight);
R = mult/(frSamp-r);
end