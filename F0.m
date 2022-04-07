function f0 = F0(frames,frSamp)
m = round(frSamp/2);
f0 = zeros(m,1);
for r=1:m
    R = autocorr(frames,frSamp,r-1);
    f0(r) = max(R);
end