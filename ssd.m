function [SSD] = ssd(L, R)    
    SSD = 0 - sumsqr(int16(L) - int16(R));
 end