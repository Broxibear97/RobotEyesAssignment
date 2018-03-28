function [SAD] = sad(L, R)
    intL = int16(L);
    intR = int16(R);

    value = intL - intR;    
    SAD = abs(value);  
end