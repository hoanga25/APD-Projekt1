function plotSUV(t,zcr,ste,ptitle)
zcrV = zcr;
zcrU = zcr;
steV = ste;
steU = ste;

silence = zcr<=1713.41 & ste<=0.002;
voiced = zcr<=1403.52 & ste>=0.025;
unvoiced = zcr>=1738.374 & ste<=0.002;

% % exclude from silence
% zcr(~silence) = NaN;
% ste(~silence) = NaN;
% exclude from voiced
zcrV(~voiced) = NaN;
steV(~voiced) = NaN;
% exluce from unvoiced
zcrU(~unvoiced) = NaN;
steU(~unvoiced) = NaN;

%ZCR
nexttile
plot(t,zcr,'k'); hold on
plot(t,zcrV,'r'); hold on
plot(t,zcrU,'b'); hold on
ylabel('ZCR');
title(ptitle)
grid on
legend('cisza','dzwieczne','bezdzwieczne');

%STE
nexttile
plot(t,ste,'k'); hold on
plot(t,steV,'r'); hold on
plot(t,steU,'b'); hold on
ylabel('STE');
grid on
legend('cisza','dzwieczne','bezdzwieczne');
end