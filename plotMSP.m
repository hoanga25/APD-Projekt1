function plotMSP(t,lster,yLabel)
plot(t,lster,'k'); hold on

yM = lster;
yS = lster;

% exclude from music
yM(lster<=0.5 | lster>1.25)=NaN;
plot(t,yM,'r'); 
hold on

% exclude from speech
yS(lster<=1.2)=NaN;
plot(t,yS,'g');
hold off

xlim([min(t) max(t)]);
ylabel(yLabel)
grid on
legend('cisza','muzyka','mowa');
end