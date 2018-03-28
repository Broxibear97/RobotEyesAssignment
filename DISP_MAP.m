% for i = 1:2
% 
%     % prepare file name of next colour image to load
%     name = ...
%         strcat('stereoPairs/pentagon_', ...
%             int2str(i) );
%     name = strcat(name, '.bmp');
% 
%     f=imread(name);
% 
%     % convert to monochrome by combining the RGB values 
%     % according to the NTSC standard
%     face = .2989*f(:,:,1)...
%         +.5870*f(:,:,2)...
%         +.1140*f(:,:,3);
% 
%     % resize to make all imgs uniform (155x128).
%     % Some imgs in this set have a few rows or cols extra
%     [sr,sc] = size(face);
%     if sr > 240
%         face = face(1:240,:);  % if there are more than 155 rows, keep only the first 155
%     end
% 
%     if sc > 320
%         face = face(:,1:320);  % if there are more than 128 columns, keep only the first 128
%     end
% 
%     % save monochrome image
%     name = ...
%         strcat('bwtest', ...
%             int2str(i) );
%     name = strcat(name, '.jpg');
% 
%     imwrite(face, name);
% 
% end  % for loop ends

% Disparity map stuff
% pLeft = rgb2gray(imread('stereoPairs\pentagon_1.bmp'));
% pRight = rgb2gray(imread('stereoPairs\pentagon_2.bmp'));

bw = 0;
fileLeft = 'stereoPairs\pentagon_1.bmp';
fileRight = 'stereoPairs\pentagon_2.bmp';

if(bw == 0)
    pLeft = imread(fileLeft);
    pRight = imread(fileRight);
else
    pLeft = rgb2gray(imread(fileLeft));
    pRight = rgb2gray(imread(fileRight));
end
% we want to loop through each pixel in the left image.
 maxRows = size(pLeft, 1);
 maxCols = size(pLeft, 2);
 dispmap = zeros(size(pLeft, 1), size(pLeft, 2));
 
 for row = 1: maxRows
     for col = 1: maxCols
        % disp("Pixel start");
         [bestPoint, bestValue, disparityVector] = PIXEL_DISP(row, col, pLeft(row, col), pRight, 7);
         dispmap(row, col) = abs(bestValue);
       %  disp("Pixel end!");
     end
 end

figure('Name', 'Clearly the better option');
imshow(dispmap);
