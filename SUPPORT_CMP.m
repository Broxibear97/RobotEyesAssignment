% Write a function, SUPPORT_CMP(), comparing two support windows.
function [difference] = SUPPORT_CMP(window1, window2)
    difference = ssd(window1, window2);
end