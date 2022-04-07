function plotParam(t,y,pTitle,yLabel)
plot(t,y);
title(pTitle);
xlim([min(t) max(t)]);
ylabel(yLabel);
grid on
end