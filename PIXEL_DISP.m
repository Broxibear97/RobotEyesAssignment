% TODO
% we can assume the searchArea is 3 for now.
function [bestPoint, bestValue, disparityVector] = PIXEL_DISP(currentRow, currentCol,...
    currentPixelValue, rightImage, searchArea)

maxRightImageRows = (currentRow + (searchArea - 1) /2);
maxRightImageCols = (currentCol + (searchArea - 1) /2);

startRightImageRows = (currentRow - (searchArea - 1) /2);
startRightImageCols = (currentCol - (searchArea - 1) /2);

bestValue = -99999999999;
bestPoint = [-1, -1];
disparityVector = [0, 0];

for row = startRightImageRows : maxRightImageRows
    if(row < 1 || row > size(rightImage,1))
       continue 
    end
    
    for col = startRightImageCols : maxRightImageCols
        if(col < 1 || col > size(rightImage,2))
            continue 
        end     
   
        pixelValue = SUPPORT_CMP(currentPixelValue, rightImage(row, col));    
        %disp(pixelValue + " pixel Value");      
        if(pixelValue > bestValue)
            bestValue = pixelValue;
            bestPoint = [row, col];
            disparityVector = [currentRow, currentCol] - bestPoint;          
%             disp("new best!");
%             disp("Value => " + bestValue);
%             disp("Point => " + bestPoint);
%             disp("Disp Vector => " + disparityVector);
        end        
    end
end