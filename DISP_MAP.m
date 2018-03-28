for i = 1:2

    % prepare file name of next colour image to load
    name = ...
        strcat('test', ...
            int2str(i) );
    name = strcat(name, '.jpg');

    f=imread(name);

    % convert to monochrome by combining the RGB values 
    % according to the NTSC standard
    face = .2989*f(:,:,1)...
        +.5870*f(:,:,2)...
        +.1140*f(:,:,3);

    % resize to make all imgs uniform (155x128).
    % Some imgs in this set have a few rows or cols extra
    [sc,sr] = size(face);
    if sr > 320
        face = face(1:320,:);  % if there are more than 155 rows, keep only the first 155
    end

    if sc > 240
        face = face(:,1:240);  % if there are more than 128 columns, keep only the first 128
    end

    % save monochrome image
    name = ...
        strcat('bwtest', ...
            int2str(i) );
    name = strcat(name, '.jpg');

    imwrite(face, name);

end  % for loop ends

% Disparity map stuff
pl = imread('bwtest1.jpg');
pr = imread('bwtest2.jpg');

diff = SUPPORT_CMP(pl, pr);

% we want to loop through each pixel in the left image.
 maxRows = 1 + size(p1, 1);
 maxCols = 1 + size(pl, 2);





