function [Cross] = Cross_Corr(L, R)
    intL = int16(L);
    intR = int16(R);
    
    Cross = intL * intR;
end