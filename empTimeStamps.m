%
%   +---------------------------------+
%   | plots for timestamps estimation |    
%   +---------------------------------+
%
% Each word will have its own figure with tiles for: 
% singals(sample), STEs,ZCRs(frame), LSTERs(clip).
% Detecting:
% voiced/unvoiced => (---,vSTE ^ZCR)
% silence ratio => (vSTE + unvoiced)
% speech/music => (^LSTER,vLSTER)


parts = ["[cz]y [t]e ry" "[sz]e[ść]" "[p]ie[s]" "o ga" "źdźy buo" "dum" ...
    "ie den"]; 
words = ["cztery" "sześć" "pies" "oga" "źdźbło" "dum" "jeden"]; 
filenames = words+".wav";
folder = ".\audio\speaker";
speakers = ('A':'D')';
files = folder+speakers+"\"+filenames

frDur = 0.02;
fs = 22050;
% sample/frame-level properties
for iw = 1:length(words)
    tests = files(:,iw)
    
    figure('units','normalized','outerposition',[0 0 1 1])
    tiledlayout(3,1);
    % (1) create a full screen window
    
    nexttile
    % (2) first tile with all files signals, time(sample wise)
    maxTs = 0;
    maxTf = 0;
    for i = 1:length(tests)
        file = tests(i)
        [sig,~] = audioread(file);
        N = length(sig);
        ts = (0:N-1)/fs;
        maxTs = max(maxTs,max(ts));
        
        plot(ts,sig,'DisplayName',file); hold on
        xlim([0 maxTs]);
        xticks(0:0.01:maxTs);
    end
    title(words(iw)+" -> "+parts(iw));
    ylabel("Aplitude");
    grid on
    hold off

    nexttile
    % (3) second tile with all files STEs, time(frame wise)
    maxSTE = 0;
    minSTE = -1;
    for i = 1:length(tests)
        file = tests(i);
        [sig,~] = audioread(file);
        [frames,tf,~,~] = generateFrames(sig,frDur,fs);
        maxTf = max(maxTf,max(tf));
        % calculate STE
        STE = sum(frames.^2);
        if minSTE<0
            minSTE = min(STE);
        else
            minSTE = min(minSTE,min(STE));
        end
        maxSTE = max(maxSTE,max(STE));
        
%         scatter(tf,STE,'s','filled','DisplayName',file); hold on;
        plot(tf,STE); hold on
        ylim([minSTE maxSTE]);
        xlim([0 maxTf]);
        xticks(0:0.01:maxTs);
    end
    title("[unvoiced] << voiced")
    ylabel("STE");
    grid on
    hold off
    
    nexttile
    % (4) third tile with all files ZCRs, time(frame wise)
    maxZCR = 0;
    minZCR = -1;
    for i = 1:length(tests)
        file = tests(i);
        [sig,~] = audioread(file);
        [frames,tf,frSamp,~] = generateFrames(sig,frDur,fs);
        maxTf = max(maxTf,max(tf));
        
        % calculate ZCR
        fSub = frames(1:frSamp-1,:);
        fAdd = frames(2:frSamp,:);
        d = sign(fAdd)-sign(fSub);
        ZCR = fs*abs(sum(d))/(2*frSamp);
        if minSTE<0
            minZCR = min(ZCR);
        else
            minZCR = min(minZCR,min(ZCR));
        end
        maxZCR = max(maxZCR,max(ZCR));
        
%         scatter(tf,ZCR,'s','filled','DisplayName',file); hold on
        plot(tf,ZCR); hold on
        ylim([minZCR maxZCR]);
        xlim([0 maxTf]);
        xticks(0:0.01:maxTs);
    end
    title("[unvoiced] >> voiced")
    ylabel("ZCR");
    grid on
    hold off
end






