function exportData(time,param1,param2,names,fileName,shNum)
if size(time,1)<size(time,2)
    time=transpose(time);
end
if size(param1,1)<size(param1,2)
    param1=transpose(param1);
end
if size(param2,1)<size(param2,2)
    param2=transpose(param2);
end
emptylabels = param1*0;
t = table(time,param1,param2,emptylabels,'VariableNames',names);
xlsPath = ".\labelling\"+fileName+".xlsx";
writetable(t,xlsPath,'Sheet',shNum);
