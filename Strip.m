function Colour_Strip = Strip(pathName,strip_start)
m = 1;
    for j = strip_start:(strip_start+9)
        for k = 1:243
            baseFileName = sprintf('ColourChip%d.tiff', j);
            fullFileName = fullfile(pathName, baseFileName);
            I = imread(baseFileName);
            Colour_Strip(:,m,:) = I(:,k,:);
            m = m+1;
        end
    end
    
    imwrite(Colour_Strip,'Colour_Strip.tiff','Resolution',300)
